// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/IRBuilder.h"
//"C:\Users\Ethan\Desktop\Classes\ECE479K_Compilers\Labs\Lab3\llvm\llvm\include\llvm\MCA\Instruction.h"

#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#define DEBUG_TYPE UnitLICM
// Define any statistics here

using namespace llvm;
using namespace ece479k;

// Hoisting allowed when :
// -  instruction operated with X, but has not assigned X in loop
// -  instruction does not have any side effects
// -  ins has side-effects, but dominates all exits

/* Cases of Conditions for hoisting (inst a op b):
  1.) both a and b are constants
  2.) both a and b are defined before the loop
  3.) both a and b refer to variables that are in the loop, but are loop invariant
    ex.)
        int x = 1;
        while(b){
          v = x + 1;
          t = v * 2;
        }
      - Since x is defined outside of the loop and not redefined in the loop
        v will remain the same regardless of the # of iterations
      - Since it is determined that v is loop invariant it can be inferred that t
        is also loop invariant because it is assigned to the result of
        an operation on v with a constant

*/

/* Process

- Perform reaching definiton analysis

*/

/* Requirements:
  - Unary
  - Binary
  - Bitwise

  - bitcasts
  - icmp
  - fcmp
  - select
  - gep
*/

/// Main function for running the LICM optimization
PreservedAnalyses UnitLICM::run(Function &F, FunctionAnalysisManager &FAM)
{
  dbgs() << "UnitLICM running on " << F.getName() << "\n";
  // Acquires the UnitLoopInfo object constructed by your Loop Identification
  // (LoopAnalysis) pass
  UnitLoopInfo &Loops = FAM.getResult<UnitLoopAnalysis>(F);

  // Perform the optimization
  // Loops.get_NaturalLoops();

  dbgs() << "========== Debug Pass ========== "
         << "\n";
  // Print all loops and their respective basic block
  dbgs() << "Total Number of Loops : " << Loops.size() << "\n";
  for (const auto &loop : Loops.get_NaturalLoops())
  {
    dbgs() << "Loop Header: " << loop.first << "\n";
    for (BasicBlock *bb : loop.second)
    {
      dbgs() << "\tBasicBlock: " << bb->getName() << "\n";
      for (BasicBlock::iterator I = bb->begin(), E = bb->end(); I != E; ++I)
      {
        bool trigger = false;
        Instruction *Inst = &*I;
        if (!Inst->isTerminator())
        { // remove if l8r
          dbgs() << "\t\tIns opcode: " << Inst->getOpcodeName() << "\n";
          if (Inst->isOnlyUserOfAnyOperand())
          {
            dbgs() << "\t\t\t CONST DETECTED ";
            trigger = true;
          }
          if (Inst->mayHaveSideEffects())
          {
            if (trigger)
            {
              dbgs() << "+ Ins may have side effects";
            }
            else
            {
              dbgs() << "\t\t\t Ins may have side effects";
            }
          }
          if (trigger)
            dbgs() << "\n";

          for (Value *op : Inst->operands())
          {
            dbgs() << "\t\t\t\toperand : " << op->getName() << "\n";
            if (Instruction *opInst = dyn_cast<Instruction>(op))
            {
              if (loop.second.count(opInst->getParent()) > 0)
              {
                break;
              }
            }
          }
        }
      }
    }
    dbgs() << "\n";
  }

  // Not needed
  dbgs() << "========== Reaching Def Pass ========== "
         << "\n";
  // Reaching definition analysis
  for (const auto &loop : Loops.get_NaturalLoops())
  {
    for (BasicBlock *bb : loop.second)
    {
      for (BasicBlock::iterator I = bb->begin(), E = bb->end(); I != E; ++I)
      {
        Instruction *Inst = &*I;
      }
    }
  }

  DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);
  dbgs() << "========== Hoisting Pass ========== "
         << "\n";
  // Actual hoisting of instructions
  for (auto &loop : Loops.get_NaturalLoops())
  {
    BasicBlock *header = *loop.second.begin(); // Get the loop header
    BasicBlock *lastBasicBlock = *loop.second.rbegin(); //last block of body


    //  creating a preheader basicblock
    //  No conditional checking | Should be run with an additional few LLVM passes to rid extraneous preheaders
    BasicBlock *preheader;
    bool preheaderCreated = false;
    if (!preheaderCreated)
    {
      dbgs() << "Header: " << header->getName() << "\n";
      preheader = BasicBlock::Create(header->getContext(), header->getName() + "_preheader", header->getParent());
       for (BasicBlock* BB : predecessors(header)) {
        // Check if the current basic block branches to successorBB
    
        if(BB == lastBasicBlock){
          dbgs() << "\tPred: " << BB->getName() << " has backedge (skip)" << "\n";
          continue;
        }else{
          dbgs() << "\tPred: " << BB->getName() << "\n";
        }
         // Iterate over all the instructions in the source basic block
        for (BasicBlock::iterator I = BB->begin(), E = BB->end(); I != E; ++I)
        {
          Instruction *Inst = &*I;
          // Check if the instruction is a branch instruction
          //dbgs() << "\t\tIns opcode: " << Inst->getOpcodeName() << "\n";

          if(isa<BranchInst>(*Inst)){
            BranchInst *branchInst = dyn_cast<BranchInst>(Inst);

            if (branchInst->isConditional()) {
              dbgs() << "\t\tConditional branch" << "\n";
              BasicBlock *blockToPush;
              int loc;
              if(branchInst->getSuccessor(0) == header){
                //true
                blockToPush = branchInst->getSuccessor(0);
                loc = 0;
              }else if(branchInst->getSuccessor(1) == header){
                //false
                blockToPush = branchInst->getSuccessor(1);
                loc = 1;
              }
              branchInst->setSuccessor(loc, preheader);
              IRBuilder<> builder(preheader);
              builder.CreateBr(blockToPush);

            }else{
                //
                for (unsigned i = 0; i < branchInst->getNumSuccessors(); ++i) {
                  if (branchInst->getSuccessor(i) == header) {
                    dbgs() << "\t\tUnconditional branch" << "\n";
                    // Move the branch instruction from foo_BB1 to the preheader block
                    BB->getTerminator()->eraseFromParent();
                    IRBuilder<> builder(BB);
                    builder.CreateBr(preheader);
                    // Found a branch to the target basic block
                    // Redirect the branch to the new target basic block
                    //branchInst->setSuccessor(i, newTargetBB);
                    builder.SetInsertPoint(preheader);
                    builder.CreateBr(header);
                  }
                }
            }

            // Update old phi's to merge from preheaders
            for (PHINode &phi : header->phis()) {
              for (unsigned i = 0; i < phi.getNumIncomingValues(); ++i) {
                if (phi.getIncomingBlock(i) == BB) {
                  phi.setIncomingBlock(i, preheader);
                }
              }
            }

          }
        }
        // // only find branches to loop header before actual loop header
        // if(BB == header){
        //   break;
        // }
        preheaderCreated = true;
      }
    }

    dbgs() << "Preheader Created!" << "\n";

    for (BasicBlock *bb : loop.second)
    {
      for (BasicBlock::iterator I = bb->begin(), E = bb->end(); I != E; ++I)
      {
        Instruction *Inst = &*I;
        if (Inst->isTerminator()) // Skip terminator operations
          continue;
        
        bool canHoist = true; // Change later to handle mem ops
        bool sideEffects = Inst->mayHaveSideEffects();
        if (!sideEffects)
        {
          for (Value *op : Inst->operands())
          {
            //dbgs() << "operands: "<< op->getName() << "\n";
            // Logic here may be incorrect
            if (Instruction *opInst = dyn_cast<Instruction>(op))
            {
              if (loop.second.count(opInst->getParent()) > 0)
              {
                canHoist = false;
                break;
              }
            }
          }
        }
        else
        {
          // ld / st
          canHoist = false;
        }

        if (canHoist)
        {
          // Inst->insertBefore(header);
          dbgs() << "Perform Hoist"
                 << "\n";
          //Inst->moveBefore(preheader->getTerminator());
        }
      }
    }
  }

  // Set proper preserved analyses
  return PreservedAnalyses::all();
}

// Command to run pass
/*
clang ../tests/doloop.c -c -O0 -Xclang -disable-O0-optnone -emit-llvm -S -o - | opt -load-pass-plugin=./libLab3.so -passes="function(mem2reg,instcombine,simplifycfg,adce),inline,globaldce,function(sroa,early-cse,unit-sccp,jump-threading,correlated-propagation,simplifycfg,instcombine,simplifycfg,reassociate,unit-licm,adce,simplifycfg,instcombine),globaldce" -S -o doloop.ll
*/

// BasicBlock::reverse_iterator rit = preheader->rbegin();
// // Check if the basic block is not empty
// if (rit != preheader->rend())
// {
//   Instruction *lastInst = &*rit;
//   dbgs() << "\t\tIns opcode: " << lastInst->getOpcodeName() << "\n";
//   // Inst->removeFromParent();   // Cause Seg Fault
//   // Inst->moveBefore(lastInst); // Cause Seg Fault
// }