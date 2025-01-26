import UW

-- Prove that the formula p → (p → (q ∨ r)) → (q → s) → (r → ¬ p) → s
-- is a tautology by completing the proof below.
--
-- To save you the tedium of doing many ImplElims, we have
-- pre-populated the assumption list.

Var (p q r s : Prop)

-- option 1: a normal proof

Def Q3a := Proof
  Asm 1: p
  Asm 2: p → (q ∨ r)
  Asm 3: q → s
  Asm 4: r → ¬ p
  ⊢ s
  By ImplElim Asm 2 Using Asm 1
  Asm 5: q ∨ r
  By OrElim Asm 5
  { Subproof 1: "lhs of ∨"
    Asm 1/1: q
    By ImplElim Asm 3 Using Asm 1/1
    Asm 1/2: s
    QED Asm 1/2
    ----------------------------
    Subproof 2: "rhs of ∨"
    Asm 2/1: r
    By ImplElim Asm 4 Using Asm 2/1
    Asm 2/2: ¬ p
    QED Contradiction Asm 1, Asm 2/2
  }

-- option 2: a longer proof that illustrates nested subproofs

Def Q3b := Proof
  Asm 1: p
  Asm 2: p → (q ∨ r)
  Asm 3: q → s
  Asm 4: r → ¬ p
  ⊢ s
  By ImplElim Asm 2
  Asm 5: q ∨ r
  By OrElim Asm 5
  { Subproof 1: "lhs of ∨"
    Asm 1/1: q
    -- every assumption needs a unique index
    -- when we are in a sub proof, the assumptions
    -- "inherit" the index of the subproof
    By ImplElim Asm 3 Using Asm 1/1
    Asm 1/2: s
    QED Asm 1/2
    ------------------------
    Subproof 2: "rhs of ∨"
    Asm 2/1: r
    By ImplElim Asm 4
    { Subproof 2/1: "lhs of →"
      ⊢ r
      QED Asm 2/1
      -------------------
      Subproof 2/2: "rhs of →"
      Asm 2/2/1: ¬ p
      QED Contradiction Asm 2/2/1, Asm 1
    }
  }
