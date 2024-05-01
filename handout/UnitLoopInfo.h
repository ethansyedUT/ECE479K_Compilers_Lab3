#ifndef INCLUDE_UNIT_LOOP_INFO_H
#define INCLUDE_UNIT_LOOP_INFO_H
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Dominators.h"
#include <map>

using namespace llvm;


namespace ece479k {
/// An object holding information about the (natural) loops in an LLVM
/// function. At minimum this will need to identify the loops, may hold
/// additional information you find useful for your LICM pass

class UnitLoopInfoHelper{
  public:
  
  UnitLoopInfoHelper(std::set<BasicBlock*> LoopBody, BasicBlock* header, BasicBlock* tail, std::set<std::pair<BasicBlock*,BasicBlock*>> LoopExits)
    : LoopBody(LoopBody), header(header), tail(tail),  LoopExits(LoopExits) 
    {}

  std::set<std::pair<BasicBlock*,BasicBlock*>> LoopExits;
  BasicBlock* preheader; 
  BasicBlock* header;
  BasicBlock* tail;
  std::set<BasicBlock*> LoopBody;

};


class UnitLoopInfo {
  // Define this class to provide the information you need in LICM
  public:
    //Constructors :
    UnitLoopInfo() {}
    /*
    UnitLoopInfo(std::map<StringRef, std::set<BasicBlock*>> &NL)
      : NaturalLoops(NL) {numberOfLoops = NL.size();}
    UnitLoopInfo(std::map<StringRef, std::set<BasicBlock*>> &NL, DominatorTree* DT, std::map<StringRef, std::set<std::pair<BasicBlock*,BasicBlock*>>> &LE)
      : NaturalLoops(NL), DomTree(DT), LoopExits(LE) {numberOfLoops = NL.size();}
    */
    UnitLoopInfo(std::map<StringRef, UnitLoopInfoHelper*> helpers, DominatorTree* DT):
    LoopHelpers(helpers),DomTree(DT){
      //get the keys
      for(auto it = helpers.begin(); it != helpers.end(); it++){
        NaturalLoopsHeaderNames.insert(it->first);
        NaturalLoops[it->first] = it->second->LoopBody;
      }
      
    }   

    
    // Setters:

    // Getters:
    std::map<StringRef,std::set<BasicBlock*>> &get_NaturalLoops() { return NaturalLoops; }

    std::set<StringRef> get_NaturalLoopHeaderNames() {return NaturalLoopsHeaderNames;}
    //UnitLoopInfoHelper get_UnitLoopInfoHelper(llvm::StringRef headerName) {return LoopHelpers[headerName];}

    int get_label_index(){ int temp = labelindex; labelindex++; return temp;}
    size_t size(){return numberOfLoops;}

    DominatorTree* getDomTree() {return DomTree;}


    std::map<StringRef, UnitLoopInfoHelper*> LoopHelpers;
    
  private:
    // Key : Header Block Name | Value : List of all BB within loop
    std::map<StringRef, std::set<BasicBlock*>> NaturalLoops;

    std::set<StringRef> NaturalLoopsHeaderNames;
    // Key : Header Block Name | Value : List of all Exits of the loop

    size_t numberOfLoops;
    DominatorTree* DomTree;
    int labelindex = 0;
};


/// Loop Identification Analysis Pass. Produces a UnitLoopInfo object which
/// should contain any information about the loops in the function which is
/// needed for your implementation of LICM
class UnitLoopAnalysis : public AnalysisInfoMixin<UnitLoopAnalysis> {
  friend AnalysisInfoMixin<UnitLoopAnalysis>;
  static AnalysisKey Key;

public:
  typedef UnitLoopInfo Result;

  UnitLoopInfo run(Function &F, FunctionAnalysisManager &AM);
};
} // namespace
#endif // INCLUDE_UNIT_LOOP_INFO_H
