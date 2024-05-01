#include "llvm/IR/Dominators.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitLoopInfo.h"

// My includes
#include <iostream>
#include <unordered_set>
#include <stack>
#define LOOPKEYISHEADER 1

using namespace llvm;
using namespace ece479k;

/// Main function for running the Loop Identification analysis. This function
/// returns information about the loops in the function via the UnitLoopInfo
/// object
UnitLoopInfo UnitLoopAnalysis::run(Function &F, FunctionAnalysisManager &FAM) {
  dbgs() << "UnitLoopAnalysis running on " << F.getName() << "\n";
  // Acquires the Dominator Tree constructed by LLVM for this function. You may
  // find this useful in identifying the natural loops
  DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);

  // (Debug Purposes) BB Identification
  // Naming each BB
  unsigned int BBIndex = 1; // Initialize a counter for basic block names
  for (BasicBlock &BB : F) {
      BB.setName((std::string)F.getName() + "_BB" + std::to_string(BBIndex));      
      ++BBIndex;
  }

  // initialize a list of natural loop here 
  //std::vector<std::set<BasicBlock*>> NaturalLoops;
  std::map<StringRef, UnitLoopInfoHelper*> helpers; 



//look for successors that dominate the current basic block
  for (BasicBlock &basicBlock : F){
    for (BasicBlock *bassicBlockSuccessor : successors(&basicBlock)){
      // if the successor doesnt dominate the current basic block, skip
      if(!DT.properlyDominates(bassicBlockSuccessor, &basicBlock)){continue;} 
    
      //not sure if this loop is necessary but it is a good idea to check if the successor(header) dominates all of predecessors(LoopBody)
      for( BasicBlock *basicBlockPredicessor : predecessors(&basicBlock)){
        //changed the condition since the previous code would define the predicessor but not use the prediciesor
        if(!DT.dominates(bassicBlockSuccessor,basicBlockPredicessor)){
          break;
          dbgs() << bassicBlockSuccessor->getName() << " does not dominate predecessor: " << basicBlockPredicessor->getName() << "\n";
        }
      }

      

      // Add nodes between the dominator node and the final node to the list of basic block
      //rename for ease 
      BasicBlock* header = bassicBlockSuccessor;
      BasicBlock* loopEnd = &basicBlock;

      std::set<BasicBlock*> LoopBody;
      LoopBody.insert(header);

      std::stack<BasicBlock*> bb_accumulate;
      bb_accumulate.push(loopEnd);

      //this could prolly be done with recursion but oh well
      while(!bb_accumulate.empty()){
        
        //pop top of stack
        BasicBlock* check = bb_accumulate.top();bb_accumulate.pop();

        //if check is in the loop body, skip
        if(LoopBody.find(check) == LoopBody.end()){
          LoopBody.insert(check);
          //push all predecessors of check onto stack
          for (BasicBlock *sub_pred : predecessors(check)){
            bb_accumulate.push(sub_pred);
          }
        }
      }

      //find the loop exits 
      std::set<std::pair<BasicBlock*,BasicBlock*>> LoopExits;


      for (BasicBlock *bb : LoopBody){
        for (BasicBlock *succ : successors(bb)){
          if(std::find(LoopBody.begin(), LoopBody.end(), succ) == LoopBody.end()){
            LoopExits.insert(std::make_pair(bb,succ));
          }
        }
      }
      UnitLoopInfoHelper* h = new UnitLoopInfoHelper(LoopBody, header, loopEnd, LoopExits);
      helpers.insert(std::make_pair(header->getName(), h));


    }

    
  }

  UnitLoopInfo Loops(helpers, &DT);

  return Loops;


}

// Initializes OUT set of each Loop
//    OUT - represents the definition
void reachingDefinitions(Function& F, UnitLoopInfo Loops){
  // // Initialize data structures
  //   std::map<BasicBlock*, std::set<Instruction*>> IN, OUT, GEN, KILL;
  //   std::set<BasicBlock*> Changed;

  //   // Initialize OUT sets to empty
  //   for (BasicBlock& BB : F) {
  //       OUT[&BB] = std::set<Instruction*>();
  //   }

  //   // Initialize IN[Entry] and OUT[Entry]
  //   BasicBlock& Entry = F.getEntryBlock();
  //   IN[&Entry] = std::set<Instruction*>();
  //   OUT[&Entry] = GEN[&Entry]; // Compute GEN[Entry]

  //   // Initialize Changed set
  //   Changed = std::set<BasicBlock*>(F.begin(), F.end());
  //   Changed.erase(&Entry);

  //   while (!Changed.empty()) {
  //       // Choose a node n from Changed
  //       BasicBlock* n = *Changed.begin();
  //       Changed.erase(Changed.begin());

  //       // Compute IN[n]
  //       IN[n] = std::set<Instruction*>();
  //       for (BasicBlock* p : predecessors(n)) {
  //           for (Instruction* I : OUT[p]) {
  //               IN[n].insert(I);
  //           }
  //       }

  //       // Compute OUT[n]
  //       OUT[n] = GEN[n]; // Compute GEN[n]
  //       for (Instruction* I : IN[n]) {
  //           if (KILL[n].count(I) == 0) { // Compute KILL[n]
  //               OUT[n].insert(I);
  //           }
  //       }

  //       // Check if OUT[n] changed
  //       bool outChanged = false;
  //       if (OUT[n] != IN[n]) {
  //           outChanged = true;
  //       }

  //       // Update Changed set
  //       if (outChanged) {
  //           for (BasicBlock* s : successors(n)) {
  //               Changed.insert(s);
  //           }
  //       }
  //   }
}

AnalysisKey UnitLoopAnalysis::Key;
