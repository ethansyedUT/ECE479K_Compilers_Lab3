#include "llvm/IR/Dominators.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitLoopInfo.h"

// My includes
#include <iostream>
#include <unordered_set>
#include <stack>

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
  //DomTreeNode baseNode = DT.getRootNode();

  

  // (Debug Purposes) BB Identification
  // Naming each BB
  unsigned int BBIndex = 1; // Initialize a counter for basic block names
  for (BasicBlock &BB : F) {
      BB.setName((std::string)F.getName() + "_BB" + std::to_string(BBIndex));      
      ++BBIndex;
  }


  // Process:
  // Search Basic Blocks for backedges
  // Iterate through backedges & identify if they properly dominate 
  //    Successor properly dominates node if it dominates all predecessors
  // If:
  //    Add all nodes to a 
  // Else : 
  //    
  //
  // Main

  // initialize a list of natural loop here 
  //std::vector<std::set<BasicBlock*>> NaturalLoops;
  std::map<StringRef, std::set<BasicBlock*>> NaturalLoops;
  for (BasicBlock &BB : F){
    for (BasicBlock *Succ : successors(&BB)){
      if(DT.dominates(Succ, &BB)){
        // Check for proper domination
        bool properDomination = true;
        for( BasicBlock *Pred : predecessors(&BB)){
          if(!DT.dominates(Succ, &BB)){
            properDomination = false;
            dbgs() << Succ->getName() << " does not dominate predecessor: " << Pred->getName() << "\n";
          }
        }

        // Add nodes between the dominator node and the final node to the list of basic blocks
        if (properDomination) {

            // Self is included
            //std::set<BasicBlock*> LoopBlocks;
            // BasicBlock* CurrentNode = Succ; // Succ = Loop header
            // for(BasicBlock *child : successors(Succ)){
            //   LoopBlocks.insert(child);
            //   CurrentNode = child;
            //   if(child->getName().compare(BB.getName()) == 0){
            //     LoopBlocks.insert(child);
            //     break;
            //   }
            // }

            std::set<BasicBlock*> LoopBody;
            LoopBody.insert(Succ);
            size_t bodyLastSize = LoopBody.size();

            std::stack<BasicBlock*> bb_accumulate;
            bb_accumulate.push(&BB);
            while(!bb_accumulate.empty()){
              BasicBlock* check = bb_accumulate.top();
              bb_accumulate.pop();
              if(LoopBody.find(check) == LoopBody.end()){
                LoopBody.insert(check);
                //push all predecessors of check onto stack
                for (BasicBlock *sub_pred : predecessors(check)){
                  bb_accumulate.push(sub_pred);
                }
              }

            }
            
            // Natural Loop debugging
            // dbgs() << "Natural Loops: " << "\n";
            // for(llvm::StringRef n : LoopBlocks){
            //   dbgs() << n;
            // }
            // dbgs() << "\n";
            NaturalLoops[Succ->getName()] = LoopBody;

        }
      }
    }
    
  }

  

  UnitLoopInfo Loops(NaturalLoops, &DT);
  // Fill in appropriate information
  //Loops.setNaturalLoops(NaturalLoops);

  return Loops;
}

AnalysisKey UnitLoopAnalysis::Key;
