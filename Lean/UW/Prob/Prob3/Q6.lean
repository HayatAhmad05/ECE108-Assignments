-----------------------------------------------------------------------
-- **Q6**
-----------------------------------------------------------------------

import UW

/-
 * Prove that the formula below is a tautology
 * (p → q → r) → (s → ¬ u) → (s ∧ ¬ u → r) → q → s → r
 * is a tautology.
 -/

Var (p q r s u : Prop)

Def Q6 := Proof
