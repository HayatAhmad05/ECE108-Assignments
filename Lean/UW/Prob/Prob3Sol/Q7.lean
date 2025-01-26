-----------------------------------------------------------------------
-- **Q7**
-----------------------------------------------------------------------

import UW

/-
 * Prove that the formula below is a tautology
 * (s → u ∧ w) → (u ∨ w) → ¬ u → (r ∧ s) → ¬ w
 -/

Var (r s u w: Prop)

Def Q1 := Proof
  ⊢ (s → u ∧ w) → (u ∨ w) → ¬ u → (r ∧ s) → ¬ w
  By ImplElim Goal
  Asm 1: s → u ∧ w
  ⊢ (u ∨ w) → ¬ u → (r ∧ s) → ¬ w
  By ImplElim Goal
  Asm 2: u ∨ w
  ⊢ ¬ u → (r ∧ s) → ¬ w
  By ImplElim Goal
  Asm 3: ¬ u
  ⊢ (r ∧ s) → ¬ w
  By ImplElim Goal
  Asm 4: r ∧ s
  ⊢ ¬ w
  By AndElim Asm 4
  Asm 5: r
  Asm 6: s
  By ImplElim Asm 1 Using Asm 6
  Asm 7: u ∧ w
  By AndElim Asm 7
  Asm 8: u
  Asm 9: w
  QED Contradiction Asm 3, Asm 9
