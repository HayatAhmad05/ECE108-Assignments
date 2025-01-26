import UW

-- Complete the proof below


Var (p q r s u : Prop)

Def Q9 := Proof
 Asm 1: p → r
 Asm 2: ¬ p → u
 Asm 3: q → s ∨ r
 Asm 4: q → r ∨ p
 Asm 5: q → p ∨ s
 Asm 6: r → u
 Asm 7: r → ¬ p
 Asm 8: s → q
 Asm 9: s → ¬ p
 Asm 10: q
  ⊢ u
  By ImplElim Asm 3 Using Asm 10
  Asm 11: p ∨ s
  By OrElim Asm 11
  { Subproof 1: "lhs of ∨"
    Asm 1/1: p
    By ImplElim Asm 1 Using Asm 1/1
    Asm 1/2: r
    By ImplElim Asm 6 Using Asm 1/2
    Asm 1/3: u
    QED Asm 1/3
    ---------------------------------
    Subproof 2: "rhs of ∨"
    Asm 2/1: s
    By ImplElim Asm 9 Using Asm 2/1
    Asm 2/2: ¬ s
    By ImplElim Asm 2 Using Asm 2/2
    Asm 2/3: u
    QED Asm 2/3
  }
