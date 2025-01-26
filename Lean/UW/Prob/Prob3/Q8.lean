-----------------------------------------------------------------------
-- **Q8**
-----------------------------------------------------------------------

import UW

/-
 * Complete the proof below to prove that the formula below is a tautology
 * (s → u ∧ p) → (u ∨ ¬ w) → ¬ u → (r ∧ s) → ¬ w
 -/

Var (p r s u w: Prop)

Def Q8 := Proof
  Asm 1: s → u ∧ p
  Asm 2: u ∨ ¬ w
  Asm 3: ¬ u
  Asm 4: r ∧ s
  ⊢ ¬ w
