-----------------------------------------------------------------------
-- **Q8**
-----------------------------------------------------------------------

import UW

/-
 * Complete the proof below to prove that the formula below is a tautology
 * (s → u ∧ p) → (u ∨ ¬ w) → ¬ u → (r ∧ s) → ¬ w
 -/

Var (p r s u w: Prop)

Def Q1 := Proof
  Asm 1: s → u ∧ p
  Asm 2: u ∨ ¬ w
  Asm 3: ¬ u
  Asm 4: r ∧ s
  ⊢ ¬ w
  By AndElim Asm 4
  Asm 5: r
  Asm 6: s
  By ImplElim Asm 1 Using Asm 6
  Asm 7: u ∧ p
  By AndElim Asm 7
  Asm 8: u
  QED Contradiction Asm 3, Asm 8
