import UW
import UW.Init.Lemmas  -- lemmas are in Lean/UW/Init/Lemmas.lean

Def mul : ℕ → ℕ → ℕ
  | 0  , m => 0
  | n+1, m => m + mul n m

Eval mul 0 0
Eval List.map (mul 1) [0,1,2,3,4,5]
Eval List.map (mul 2) [0,1,2,3,4,5]
Eval List.map (mul 3) [0,1,2,3,4,5]

Theorem mulIsMul :=
  ∀ (n m), mul n m = n * m
Proof
