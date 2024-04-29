// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Dominators.h"
//"C:\Users\Ethan\Desktop\Classes\ECE479K_Compilers\Labs\Lab3\llvm\llvm\include\llvm\MCA\Instruction.h"

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
PreservedAnalyses UnitLICM::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitLICM running on " << F.getName() << "\n";
  // Acquires the UnitLoopInfo object constructed by your Loop Identification
  // (LoopAnalysis) pass
  UnitLoopInfo &Loops = FAM.getResult<UnitLoopAnalysis>(F);

  // Perform the optimization
  //Loops.get_NaturalLoops();

  dbgs() <<"========== Debug Pass ========== " << "\n";
  // Print all loops and their respective basic block
  dbgs() << "Total Number of Loops : " << Loops.size() << "\n";
  for (const auto& loop : Loops.get_NaturalLoops()) {
    dbgs() << "Loop Header: " << loop.first << "\n";
    for (BasicBlock* bb : loop.second) {
        dbgs() << "\tBasicBlock: " << bb->getName() << "\n";
        for (BasicBlock::iterator I = bb->begin(), E = bb->end(); I != E; ++I) {
          bool trigger = false;
          Instruction *Inst = &*I;
          if(!Inst->isTerminator()){ // remove if l8r
            dbgs() << "\t\tIns opcode: "<< Inst->getOpcodeName() << "\n";
            if(Inst->isOnlyUserOfAnyOperand()){
              dbgs() << "\t\t\t CONST DETECTED ";
              trigger = true;
            }
            if(Inst->mayHaveSideEffects()){
              if(trigger){
                dbgs() << "+ Ins may have side effects";
              }else{
                dbgs() << "\t\t\t Ins may have side effects";
              }
            }
            if (trigger) dbgs() << "\n";

            for (Value* op : Inst->operands()) {
                dbgs() << "\t\t\t\toperand : " << op->getName() << "\n";
                if (Instruction* opInst = dyn_cast<Instruction>(op)) {
                    if (loop.second.count(opInst->getParent()) > 0) {
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
  dbgs() <<"========== Reaching Def Pass ========== " << "\n";
  // Reaching definition analysis
  for (const auto& loop : Loops.get_NaturalLoops()) {
    for (BasicBlock* bb : loop.second) {
        for (BasicBlock::iterator I = bb->begin(), E = bb->end(); I != E; ++I) {
          Instruction *Inst = &*I;
        }
    }
  }

  DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);

  dbgs() <<"========== Hoisting Pass ========== " << "\n";
  // Actual hoisting of instructions
    for (auto& loop : Loops.get_NaturalLoops()) {
      BasicBlock* header = *loop.second.begin(); // Get the loop header

      //BasicBlock* preheader = F.getBasicBlockByName(loop.first); // Get the loop preheader
      // create a preheader basicblock
      BasicBlock* preheader;
      bool preheaderCreated = false;

      if(!preheaderCreated){
        preheader = BasicBlock::Create(header->getContext(), "preheader", header->getParent());
        BranchInst::Create(header, preheader);
        for (BasicBlock *pred : predecessors(header)) {
            pred->getTerminator()->replaceUsesOfWith(header, preheader);
        }
        //DT.addNewBlock(preheader, header);
        
        preheaderCreated = true;
      }

      for (BasicBlock* bb : loop.second) {
          for (BasicBlock::iterator I = bb->begin(), E = bb->end(); I != E; ++I) {
            Instruction *Inst = &*I;
            // Skip terminator operations
            if(Inst->isTerminator()){
              continue;
            }

            bool canHoist = !Inst->mayHaveSideEffects(); // Change later to handle mem ops

            bool sideEffects = Inst->mayHaveSideEffects();
            if(!sideEffects){
              for (Value* op : Inst->operands()) {
                  if (Instruction* opInst = dyn_cast<Instruction>(op)) {
                      if (loop.second.count(opInst->getParent()) > 0) {
                          canHoist = false;
                          break;
                      }
                  }
              }
            }else{
              // ld / st

            }
            
            if (canHoist) {
              //Inst->insertBefore(header);
              dbgs() << "Perform Hoist" << "\n";
              //Inst->moveBefore(preheader->getTerminator());
              BasicBlock::reverse_iterator rit = bb->rbegin();
              // Check if the basic block is not empty
              if (rit != bb->rend()) {
                  Instruction* lastInst = &*rit;
                  dbgs() << "\t\tIns opcode: "<< lastInst->getOpcodeName() << "\n";
                  //Inst->removeFromParent(); // Cause Seg Fault
                  //Inst->moveBefore(lastInst); // Cause Seg Fault
              }
            }
          }
      }
  }
  

  // Set proper preserved analyses
  return PreservedAnalyses::all();
}


