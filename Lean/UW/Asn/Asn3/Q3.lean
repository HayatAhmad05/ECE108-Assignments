-----------------------------------------------------------------------
-- **Q3**
-----------------------------------------------------------------------

import UW

/-
 * Complete the proof below to prove that the formula below is a tautology
 * (s → u ∨ ¬p) → ¬u → (u ∨ r) → (r ∨ ¬p → ¬q) → ¬q
 * To save you the effort of doing repetitive ImplElims at the beginning of
 * the proof, we have pre-populated the assumptions.
 -/

Var (p q r s u: Prop)

Def Q3 := Proof
    Asm 1: s → u ∨ ¬p
    Asm 2: ¬u
    Asm 3: u ∨ r
    Asm 4: r ∨ ¬p → ¬q
    ⊢ ¬q
