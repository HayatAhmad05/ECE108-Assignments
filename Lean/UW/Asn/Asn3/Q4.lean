import UW

-- Complete the proof below
--
-- This proof is challenging because there are multiple
-- assumptions that can be used.  Try to sketch out your
-- strategy before doing the actual proof, so that you
-- pick a strategy that leads to a short proof.


Var (p q r s u w : Prop)

Def Q4 := Proof
  Asm 1: r → p
  Asm 2: s ∧ u → w
  Asm 3: r → ¬u
  Asm 4: ¬s → u
  Asm 5: p → s ∨ u
  Asm 6: p ∨ s
  Asm 7: w → r
  Asm 8: u ∨ ¬u
  Asm 9: r
  Asm 10: s → ¬p
  ⊢ w
