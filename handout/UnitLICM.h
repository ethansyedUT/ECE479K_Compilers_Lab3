#ifndef INCLUDE_UNIT_LICM_H
#define INCLUDE_UNIT_LICM_H
#include "llvm/IR/PassManager.h"

using namespace llvm;

namespace ece479k {
/// Loop Invariant Code Motion Optimization Pass
struct UnitLICM : PassInfoMixin<UnitLICM> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
  void Hoist(std::pair<const llvm::StringRef, std::set<llvm::BasicBlock *>> &loop, UnitLoopInfo Loops);
  bool canHoist(Instruction *i, BasicBlock *bb, BasicBlock *Header, UnitLoopInfo Loops);
  bool isLoopInvariant(Instruction *i);
};
} // namespace

#endif // INCLUDE_UNIT_LICM_H
