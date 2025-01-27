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
  By OrElim Asm 3 {
      Subproof 1: "LHS of ∨"
      Asm 3/1: u
      QED Contradiction Asm 2, Asm 3/1

      Subproof 2: "RHS of ∨"
      Asm 3/2: r
      By ImplElim Asm 4 Using Asm 3/3
      Asm 3/3: r ∨ ¬p
      Asm 3/4: ¬q
      QED Asm 3/4

  }
