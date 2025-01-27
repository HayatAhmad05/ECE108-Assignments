import UW

/-
 * Prove that the formula below is a tautology
 * (p ∨ q) → (p → s) → (q → s) → (s → r) → r
 -/

Var (p q r s : Prop)

Def Q1 := Proof
  ⊢ (p ∨ q) → (p → s) → (q → s) → (s → r) → r

  By ImplElim Goal
  Asm 1: p ∨ q
  ⊢ (p → s) → (q → s) → (s → r) → r
  By ImplElim Goal
  Asm 2: p → s
  ⊢ (q → s) → (s → r) → r
  By ImplElim Goal
  Asm 3: q → s
  ⊢ (s → r) → r
  By ImplElim Goal
  Asm 4: s → r
  ⊢ r
  By OrElim Asm 1
  {
    Subproof 1: "LHS of ∨"
    Asm 1/1: p
    By ImplElim Asm 2 Using Asm 1/1
    Asm 1/2: s
    By ImplElim Asm 4 Using Asm 1/2
    Asm 1/3: r
    QED Asm 1/3
    -----------------------------------------
    Subproof 2: "RHS of ∨"
    Asm 2/1: q
    By ImplElim Asm 3 Using Asm 2/1
    Asm 2/2: s
    By ImplElim Asm 4 Using Asm 2/2
    Asm 2/3: r
    QED Asm 2/3
  }
