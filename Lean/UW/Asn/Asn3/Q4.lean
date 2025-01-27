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

  By ImplElim Asm 1 Using Asm 9
  Asm 11: p

  By ImplElim Asm 5 Using Asm 11
  Asm 12: s ∨ u

  By OrElim Asm 12
    {
      -- Case 1: Assume s.
      Subproof 1: "LHS of ∨"
      Asm 12/1: s
      By ImplElim Asm 10 Using Asm 12/1
      Asm 12/2: ¬p
      QED Contradiction Asm 11, Asm 12/2


      ----------------------------------
      -- Case 2: Assume u.
      Subproof 2: "RHS of ∨"
      Asm 12/3: u
      By AndIntro Asm 12/3, Asm 12/1
      Asm 12/4: s ∧ u
      By ImplElim Asm 2 Using Asm 12/4
      Asm 12/5: w
      QED Asm 12/5
    }
