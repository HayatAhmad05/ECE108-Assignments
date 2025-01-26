import UW

-- Prove that the formula (p → r) → (q → r) → (p ∧ q) → r
-- is a tautology.

Var (p q r : Prop)

Def Q1 := Proof
  ⊢ (p → r) → (q → r) → (p ∧ q) → r
  By ImplElim Goal
  Asm 1: p → r
  ⊢ (q → r) → (p ∧ q) → r
  By ImplElim Goal
  Asm 2: q → r
  ⊢ (p ∧ q) → r
  By ImplElim Goal
  Asm 3: p ∧ q
  ⊢ r
  By AndElim Asm 3
  Asm 4: p
  Asm 5: q
  By ImplElim Asm 1 Using Asm 4
  Asm 6: r
  QED Asm 6
