import UW

Var (p q r s t u v w : Prop)

Def Q10a := Proof
  Asm 1: w
  Asm 2: v
  Asm 3: w → p
  Asm 4: p → r
  Asm 5: p → s ∨ q
  Asm 6: u ∨ r
  Asm 7: u → v
  Asm 8: r → p
  Asm 9: v → q ∧ s
  Asm 10: s → v
  Asm 11: s → t
  Asm 12: r → t
  ⊢ t

Def Q10b := Proof
  Asm 1: w ∨ r
  Asm 3: w → p
  Asm 4: p → r
  Asm 5: p → s ∨ q
  Asm 6: u ∨ r
  Asm 7: u → v
  Asm 8: r → p
  Asm 9: v → q ∧ s
  Asm 10: s → v
  Asm 11: s → t
  Asm 12: r → t
  ⊢ t
