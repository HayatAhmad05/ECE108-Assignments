import UW
import UW.Init.Lemmas  -- lemmas are in Lean/UW/Init/Lemmas.lean

Theorem div8 :=
  ∀ (n:ℕ), ∃ (k : ℕ), (2*n+1)^2 - 1 = k*8
Proof
