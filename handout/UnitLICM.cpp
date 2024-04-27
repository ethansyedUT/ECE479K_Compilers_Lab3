// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"

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

  dbgs() <<"========== Hoisting Pass ========== " << "\n";
  // Actual hoisting of instructions
    for (const auto& loop : Loops.get_NaturalLoops()) {
    for (BasicBlock* bb : loop.second) {
        for (BasicBlock::iterator I = bb->begin(), E = bb->end(); I != E; ++I) {
          Instruction *Inst = &*I;
          //dbgs() << Inst->getOpcode() << "\n";
          // Skip terminator operations
          if(!Inst->isTerminator()){

          }
          
        }
    }
  }

  // Set proper preserved analyses
  return PreservedAnalyses::all();
}

// Initializes OUT set of each Loop
//    OUT - represents the definition
void reachingDefinitions(Function& F, UnitLoopInfo){

}
