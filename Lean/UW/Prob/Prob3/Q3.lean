import UW

-- Prove that the formula p → (p → (q ∨ r)) → (q → s) → (r → ¬ p) → s
-- is a tautology by completing the proof below.
--
-- To save you the tedium of doing many ImplElims, we have
-- pre-populated the assumption list.

Var (p q r s : Prop)

Def Q3 := Proof
  Asm 1: p
  Asm 2: p → (q ∨ r)
  Asm 3: q → s
  Asm 4: r → ¬ p
  ⊢ s
