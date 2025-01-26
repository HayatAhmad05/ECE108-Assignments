-----------------------------------------------------------------------
-- **Q1**
-----------------------------------------------------------------------

import UW

/-
 * Prove that the formula below is a tautology
 * (p → q → r) → (s → ¬ u) → (s ∧ ¬ u → r) → q → s → r
 * is a tautology.
 -/

Var (p q r s u : Prop)

Def Q6 := Proof
  ⊢ (p → q → r) → (s → ¬ u) → (s ∧ ¬ u → r) → q → s → r
  By ImplElim Goal
  Asm 1: (p → q → r)
  ⊢ (s → ¬ u) → (s ∧ ¬ u → r) → q → s → r
  By ImplElim Goal
  Asm 2: (s → ¬ u)
  ⊢ (s ∧ ¬ u → r) → q → s → r
  By ImplElim Goal
  Asm 3: (s ∧ ¬ u → r)
  ⊢ q → s → r
  By ImplElim Goal
  Asm 4: q
  ⊢ s → r
  By ImplElim Goal
  Asm 5: s
  ⊢ r
  By ImplElim Asm 2 Using Asm 5
  Asm 6: ¬ u
  By ImplElim Asm 3
  { Subproof 1: "lhs of →"
    ⊢ s ∧ ¬ u
    By AndElim Goal
    { Subproof 1/1: "lhs of ∧"
      ⊢ s
      QED Asm 5
      -------------------------------
      Subproof 1/2: "rhs of ∧"
      ⊢ ¬ u
      QED Asm 6
    }
    --------------------------------------
    Subproof 2: "rhs of →"
    Asm 2/1: r
    QED Asm 2/1
  }
