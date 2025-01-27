-----------------------------------------------------------------------
-- **Q2**
-----------------------------------------------------------------------

import UW

/-
 * Prove that the formula below is a tautology
 * (p ∨ q) → (p → r) → (q → s) → (r ∨ s)
 -/

Var (p q r s : Prop)

Def Q2 := Proof
  ⊢ (p ∨ q) → (p → r) → (q → s) → (r ∨ s)
  By ImplElim Goal
  Asm 1: p ∨ q
  ⊢ (p → r) → (q → s) → (r ∨ s)
  By ImplElim Goal
  Asm 2: p → r
  ⊢ (q → s) → (r ∨ s)
  By ImplElim Goal
  Asm 3: q → s
  ⊢ r ∨ s
  By OrElim Asm 1
  {
    Subproof 1: "LHS of ∨"
    Asm 1/1: p
    By ImplElim Asm 2 Using Asm 1/1
    Asm 1/2: r
    QED Asm 1/2

    Subproof 2: "RHS of ∨"
    Asm 2/1: q
    By ImplElim Asm 3 Using Asm 2/1
    Asm 2/2: s
    QED Asm 2/2

  }
