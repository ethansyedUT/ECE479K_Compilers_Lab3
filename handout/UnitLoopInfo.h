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
class UnitLoopInfo {
  // Define this class to provide the information you need in LICM
  public:
    //Constructors :
    UnitLoopInfo() {}
    UnitLoopInfo(std::map<StringRef, std::set<BasicBlock*>> &NL)
      : NaturalLoops(NL) {numberOfLoops = NL.size();}
    UnitLoopInfo(std::map<StringRef, std::set<BasicBlock*>> &NL, DominatorTree* DT)
      : NaturalLoops(NL), DomTree(DT) {numberOfLoops = NL.size();}
    
    // Setters:
    void setNaturalLoops(std::map<StringRef, std::set<BasicBlock*>> &NL) { NaturalLoops = NL; numberOfLoops = NL.size();}

    // Getters:
    std::map<StringRef, std::set<BasicBlock*>>& get_NaturalLoops() {return NaturalLoops;}
    int get_label_index(){ int temp = labelindex; labelindex++; return temp;}
    size_t size(){return numberOfLoops;}

    DominatorTree* getDomTree() {return DomTree;}

  private:
    // Key : Header Block Name | Value : List of all BB within loop
    std::map<StringRef, std::set<BasicBlock*>> NaturalLoops;
    size_t numberOfLoops;
    DominatorTree* DomTree;
    int labelindex = 0;

    
};

class UnitLoopInfoHelper{
  public:


  private:
  BasicBlock* preheader;
  std::set<BasicBlock*> LoopBody;
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
