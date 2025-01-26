import UW

-- Prove that the formula (p → q) → (r → q) → ((p ∨ r) → q)
-- is a tautology.

Var (p q r : Prop)

Def Q2 := Proof
  ⊢ (p → q) → (r → q) → ((p ∨ r) → q)
  By ImplElim Goal
  Asm 1: p → q
  ⊢ (r→ q) → ((p ∨ r) → q)
  By ImplElim Goal
  Asm 2: r → q
  ⊢ (p ∨ r) → q
  By ImplElim Goal
  Asm 3: p ∨ r
  ⊢ q
  By OrElim Asm 3
  { Subproof 1: "lhs or ∨"
    Asm 1/1: p
    By ImplElim Asm 1 Using Asm 1/1
    Asm 1/2: q
    QED Asm 1/2
    ------------------------
    Subproof 2: "rhs of ∨"
    Asm 2/1: q
    By ImplElim Asm 2 Using Asm 2/1
    Asm 2/2: q
    QED Asm 2/2
  }
