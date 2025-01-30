-----------------------------------------------------------------------
-- **Q1**
-----------------------------------------------------------------------

import UW

/-
 * Complete the proof below
 *
 * *NOTE*:  If you feel confident with the simple
 * elimination rules, in particular ImplElim and ForallElim,
 * try the proof with Elims rule to shorten the proof.
 *
 -/

Var (p q r s u : ℕ → Prop)

Def Q1 := Proof
    Asm 1: ∀ (x : ℕ), q x → p x
    Asm 2: ∃ ( x : ℕ), ¬ (p x)
    Asm 3: (∃ (z : ℕ), p z) ∨ (∀ (z : ℕ), q z)
    Asm 5: ∀ (y : ℕ), p y → q (y+1)
    ⊢ ∀ (x : ℕ), p x → ∃ (y : ℕ), p y ∧ q y
