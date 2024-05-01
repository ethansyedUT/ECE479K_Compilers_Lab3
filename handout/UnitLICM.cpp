// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"
#define LOOPKEYISHEADER 1

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Analysis/AliasAnalysis.h"

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
PreservedAnalyses UnitLICM::run(Function &F, FunctionAnalysisManager &FAM)
{
  dbgs() << "UnitLICM running on " << F.getName() << "\n";
  // Acquires the UnitLoopInfo object constructed by your Loop Identification
  // (LoopAnalysis) pass
  UnitLoopInfo &Loops = FAM.getResult<UnitLoopAnalysis>(F);
  AAResults &AliasAnalis = FAM.getResult<AAManager>(F);


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

  DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);

  dbgs() << "========== Hoisting Pass ========== "
         << "\n";

  // Actual hoisting of instructions
  for (auto &loop : Loops.get_NaturalLoops())
  {
    Hoist(loop, Loops, AliasAnalis);
  }

  // Set proper preserved analyses
  return PreservedAnalyses::all();
}

void UnitLICM::Hoist(std::pair<const llvm::StringRef, std::set<llvm::BasicBlock *>> &loop, UnitLoopInfo Loops, AAResults &AliasAnalis)
{

// get the loop header
#ifdef LOOPKEYISHEADER
  BasicBlock *header = *loop.second.begin(); // Get the loop header
  assert(header->getName() == loop.first && "Header name does not match loop name");
#else
  BasicBlock *header = loop.second.begin(); // Get the loop header
#endif

  BasicBlock *tail = *loop.second.rbegin(); // last block of body

  // CHANGE: removed the preheaderCreated is false check since it is always false
  // CHANGE: make the preheader be inserted before the header instead of at the end of the function
  // BasicBlock* preheader = BasicBlock::Create(header->getContext(), "preheader",nullptr, header);
  BasicBlock *preheader = CreatePreheader(header, tail);
  /*
  assert(preheader!=nullptr && "Preheader not created");
  assert(header!=nullptr && "could not get header from loop in LICM");
  BranchInst::Create(header, preheader); // Causes Seg fault when switched (preheader, header)
  for (BasicBlock *pred : predecessors(header))
  {
    //replace the uses with the preheader
    pred->getTerminator()->replaceUsesOfWith(header, preheader);
  }
  */

  for (BasicBlock *bb : loop.second)
  {
    // Skip the header
    if (bb == header && bb->getName().compare(header->getName()) == 0)
    {
      continue;
    }

    for (BasicBlock::iterator I = bb->begin(), E = bb->end(); I != E; ++I)
    {
      Instruction *Inst = &*I;
      dbgs() << "Instruction: " << Inst->getOpcodeName()<< " " ;
      // Skip terminator operations
      if (Inst->isTerminator())
      {
        continue;
      }
      // UnitLoopInfoHelper helper= Loops.get_UnitLoopInfoHelper(header->getName());
      UnitLoopInfoHelper helper = *(Loops.LoopHelpers[header->getName()]);

      bool canHoist = this->Can_Hoist(Inst, bb, helper, Loops.getDomTree());
      bool isLoopInvarient= Is_Loop_Invariant(Inst, loop.second); //regular loop invariance

      bool isLoopMemoryInvarient = Is_LoadStore_Loop_Invariant(Inst,helper, &AliasAnalis); // load/store loop invariance

      if (canHoist && isLoopInvarient) // if you can safely hoist it and it is loop invarient
      {
        dbgs() << "Perform Hoist " << Inst->getName() << "\n";
        // https://stackoverflow.com/questions/13370306/how-to-insert-a-llvm-instruction
        auto topofPreheader = preheader->end()--;
        topofPreheader--;
        IRBuilder<> Builder = IRBuilder<>(preheader, topofPreheader);
        //Builder.Insert(Inst);
        Instruction *clonedInst = Inst->clone();
        Builder.Insert(clonedInst);
        preheader->print(dbgs());
        I++;
        Inst->replaceAllUsesWith(clonedInst);
        bb->getInstList().remove(*Inst);
      }
      else
      {
        dbgs() << "Cannot Hoist " << Inst->getName() << "\n";
      }
      // else if(canHoist && isLoopMemoryInvarient){
      //   dbgs() << "Perform load store Hoist " << Inst->getName()<< "\n";
      //   int opcode =Inst->getOpcode();
      //   LoadInst* loadInstruction;
      //   StoreInst* storeInstruction;
      //   if(opcode == Instruction::Load && LoadInst::classof(Inst)){
      //     if (!(loadInstruction = dyn_cast<LoadInst>(Inst))){continue;}
      //     llvm::Value* address = loadInstruction->getPointerOperand();
      //     bool addressIsConstant = isa<Constant>(address);

      // }
      //   else if(opcode == Instruction::Store && LoadInst::classof(Inst)){
      //     storeInstruction = dyn_cast<StoreInst>(Inst);
      //     llvm::Value* address = storeInstruction->getPointerOperand();
      //     bool addressIsConstant = isa<Constant>(address);

      //   }
      //   else {
      //     //something went wrong
      //   }
      // }
    }
  }
}

bool UnitLICM::Can_Hoist(Instruction *i, BasicBlock *bb, UnitLoopInfoHelper Loop, DominatorTree *DT)
{
  if (isSafeToSpeculativelyExecute(i))
  {
    return true;
  }

  // check if bb dominates all exits
  for (auto &exit : Loop.LoopExits)
  {
    assert(exit.first != nullptr && "Exit block is null");

    if (!DT->properlyDominates(bb, exit.first))
    {
      return false;
    }
  }

  return true;
}

// returns true if the instruction is loop invariant
bool UnitLICM::Is_Loop_Invariant(Instruction *i, std::set<BasicBlock *> loop)
{
  // every operand of i is either constant or defined outside of the loop

  // 2.) Every operand of the instruction is either const or computed outside of loop
  for (Value *op : i->operands())
  {
    // get the operands of I
    if (Instruction *opInst = dyn_cast<Instruction>(op))
    {
      BasicBlock *bb = opInst->getParent();
      // if the the instruction was defined in the body of the loop then it is not loop invariant;

      if (In_Loop(bb, loop, true))
      { // return false if basic block is only in the loop body.. not the including hte header
        return false;
      }
    }

    // if it couldnt cast to a instruction then it is a constant ... so it is loop invariant
  }

  // 1.) If it is LLVM ins (binary op, shift, select, cast, gep)
  // check if the operation is binary opreator, shift, select, cast, getelementptr,
  bool first = false, second = false;
  if (i->isBinaryOp() || i->isShift() || i->isCast() || i->getOpcode() == Instruction::GetElementPtr || i->getOpcode() == Instruction::Select)
  {
    return true;
  }
  else{
    return false;
  }

}

bool UnitLICM::In_Loop(BasicBlock *bb, std::set<BasicBlock *> loop, bool includeHeader)
{
  auto begin = loop.begin();
  if (!includeHeader)
  {
    begin++;
  }
  return std::find(begin, loop.end(), bb) != loop.end();
}

BasicBlock *UnitLICM::CreatePreheader(BasicBlock *header, BasicBlock *tail)
{
  dbgs() << "Header: " << header->getName() << "\n";
  BasicBlock *preheader = BasicBlock::Create(header->getContext(), header->getName() + "_preheader", header->getParent());
  for (BasicBlock *BB : predecessors(header))
  {
    // Check if the current basic block branches to successorBB

    if (BB == tail)
    { // skip loop tail
      dbgs() << "\tPred: " << BB->getName() << " has backedge (skip)"
             << "\n";
      continue;
    }
    else
    {
      dbgs() << "\tPred: " << BB->getName() << "\n";
    }

    // Iterate over all the instructions in the source basic block
    for (BasicBlock::iterator I = BB->begin(), E = BB->end(); I != E; ++I)
    {
      Instruction *Inst = &*I;
      // Check if the instruction is a branch instruction
      // dbgs() << "\t\tIns opcode: " << Inst->getOpcodeName() << "\n";

      if (Inst && isa<BranchInst>(*Inst))
      {
        BranchInst *branchInst = dyn_cast<BranchInst>(Inst);

        if (branchInst->isConditional())
        {
          dbgs() << "\t\tConditional branch"
                 << "\n";
          BasicBlock *blockToPush;
          int loc;
          if (branchInst->getSuccessor(0) == header)
          {
            // true
            blockToPush = branchInst->getSuccessor(0);
            loc = 0;
          }
          else if (branchInst->getSuccessor(1) == header)
          {
            // false
            blockToPush = branchInst->getSuccessor(1);
            loc = 1;
          }
          branchInst->setSuccessor(loc, preheader);
          IRBuilder<> builder(preheader);
          builder.CreateBr(blockToPush);
        }

        else
        {
          bool hasHeaderSuccessor = false;
          for (unsigned i = 0; i < branchInst->getNumSuccessors(); ++i)
          {
            if (branchInst->getSuccessor(i) == header)
            {
              // Set the successor
              branchInst->setSuccessor(i, preheader);
              hasHeaderSuccessor = true;
              break;
            }
          }

          if (hasHeaderSuccessor)
          {
            dbgs() << "\t\tUnconditional branch"
                   << "\n";

            // Move the branch instruction from BB to the preheader block
            BB->getTerminator()->eraseFromParent();
            IRBuilder<> builder(BB);
            builder.CreateBr(preheader);

            // Create a single branch instruction in the preheader block
            builder.SetInsertPoint(preheader);
            builder.CreateBr(header);
          }
        }

        // Update old phi's to merge from preheaders
        for (PHINode &phi : header->phis())
        {
          for (unsigned i = 0; i < phi.getNumIncomingValues(); ++i)
          {
            if (phi.getIncomingBlock(i) == BB)
            {
              phi.setIncomingBlock(i, preheader);
            }
          }
        }
      }
    }
  }
  return preheader;
}

bool UnitLICM::Is_LoadStore_Loop_Invariant(Instruction* I, UnitLoopInfoHelper helper, AAResults* AA){
  auto opcode = I->getOpcode(); LoadInst* loadInstruction; StoreInst* storeInstruction;
  if(opcode != Instruction::Load && opcode != Instruction::Store){return false;}
  //do if load instruction
  else if(opcode == Instruction::Load && LoadInst::classof(I)){
    dbgs() << "Load Instruction Detected\n";
    //try to cast to load instruction
    if (!(loadInstruction = dyn_cast<LoadInst>(I))){return false; dbgs()<< "Could not cast to LoadInst\n";}

    //get the address operad  
    llvm::Value* address = loadInstruction->getPointerOperand();

    //constant address means at it is loop invariant i think because the stuff in the value is not changing.
    //for example the global vtable prototype in lab2
    if(isa<Constant>(address)){return true;}
    else{
       //check if the address is stored on in the loop
      for(User* addressUser : address->users()){
        if(StoreInst* addressUserInst = dyn_cast<StoreInst>(addressUser)){
          if(helper.LoopBody.count(addressUserInst->getParent()) > 0){
            return false;
          }
        }
      }
      //check if that address can be aliased with any other address in the loop
      for(BasicBlock* bb : helper.LoopBody){
        for(Instruction& inst : *bb){
          if(StoreInst* storeInst = dyn_cast<StoreInst>(&inst)){
            if(!AA->isNoAlias(address, storeInst->getPointerOperand())){
              return false;
            }
          }
        }
      }

      //if its not being stored on by its direct address nor its aliased with any other store instruction
      return true;
    }
  }
  else if(opcode == Instruction::Store && StoreInst::classof(I)){
    storeInstruction = dyn_cast<StoreInst>(I);
    llvm::Value* address = storeInstruction->getPointerOperand();
    if(isa<Constant>(address)) return true;
    
    // stores can be hoisted up if they are not loaded from in the loop and from an add



  }
  else{
    dbgs() << "Instruction is not a load or store instruction but sometihign went wrong in Is_LoadStore_Loop_Invariant\n";
    return false;
  }


}



