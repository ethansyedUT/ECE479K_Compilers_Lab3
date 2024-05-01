#ifndef INCLUDE_UNIT_LICM_H
#define INCLUDE_UNIT_LICM_H
#include "llvm/IR/PassManager.h"
#include "UnitLoopInfo.h"
#include "llvm/Analysis/AliasAnalysis.h"

using namespace llvm;

namespace ece479k {
/// Loop Invariant Code Motion Optimization Pass
struct UnitLICM : PassInfoMixin<UnitLICM> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);

  void Hoist(std::pair<const llvm::StringRef, std::set<llvm::BasicBlock *>> &loop, UnitLoopInfo Loops, AAResults &AliasAnalis);

  bool Can_Hoist(Instruction* i, BasicBlock* bb ,UnitLoopInfoHelper Loop, DominatorTree* DT);
  
  std::pair<bool,bool> Is_Loop_Invariant(Instruction* i, std::set<BasicBlock*> loop);
  
  bool In_Loop(BasicBlock* bb, std::set<BasicBlock*> loop,bool includeHeader);
  
  BasicBlock* CreatePreheader(BasicBlock* header, BasicBlock* tail);
};
} // namespace

#endif // INCLUDE_UNIT_LICM_H
