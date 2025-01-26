import UW

-- Complete the proof below
-- This proof is challenging because there are multiple
-- assumptions that can be used.  Try to sketch out your
-- strategy before doing the actual proof, so that you
-- pick a strategy that leads to a short proof.

Var (p q r s u : Prop)

Def Q1 := Proof
  Asm 1: p
  Asm 2: p → s ∨ q
  Asm 3: p → q ∨ r
  Asm 4: p → r ∨ s
  Asm 5: r → u
  Asm 6: ¬ s → u
  Asm 7: r → ¬ s
  Asm 8: q → p
  Asm 9: q → ¬ s
  Asm 10: s → r
  ⊢ u
  By ImplElim Asm 3 Using Asm 1
  Asm 11: s ∨ q
  By OrElim Asm 11
  { Subproof 1: "lhs of ∨"
    Asm 1/1: s
    By ImplElim Asm 10 Using Asm 1/1
    Asm 1/2: r
    By ImplElim Asm 5 Using Asm 1/2
    Asm 1/3: u
    QED Asm 1/3
    ---------------------------------
    Subproof 2: "rhs of ∨"
    Asm 2/1: q
    By ImplElim Asm 9 Using Asm 2/1
    Asm 2/2: ¬ s
    By ImplElim Asm 6 Using Asm 2/2
    Asm 2/3: u
    QED Asm 2/3
  }
