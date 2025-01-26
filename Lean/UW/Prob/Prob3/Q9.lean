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
