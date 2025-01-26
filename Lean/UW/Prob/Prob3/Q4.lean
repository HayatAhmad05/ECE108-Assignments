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
