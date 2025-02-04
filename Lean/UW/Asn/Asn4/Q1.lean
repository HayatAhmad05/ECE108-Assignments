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
    Asm 2: ∃ (x : ℕ), ¬ (p x)
    Asm 3: (∃ (z : ℕ), p z) ∨ (∀ (z : ℕ), q z)
    Asm 5: ∀ (y : ℕ), p y → q (y+1)
    ⊢ ∀ (x : ℕ), p x → ∃ (y : ℕ), p y ∧ q y


    By ForallElim Goal
    Asm 6: Var (a : ℕ)
    ⊢ p a → ∃ (y : ℕ), p y ∧ q y

    By ImplElim Goal
    Asm 7: p a
    ⊢ ∃ (y : ℕ), p y ∧ q y

    By ForallElim Asm 5 Using y = a
    Asm 8: p a → q (a+1)

    By ImplElim Asm 8 Using Asm 7
    Asm 9: q (a+1)

    By ForallElim Asm 1 Using x = (a+1)
    Asm 10: q (a+1) → p (a+1)

    By ImplElim Asm 10 Using Asm 9
    Asm 11: p (a+1)

    By AndIntro Asm 11, Asm 9
    Asm 12: p (a+1) ∧ q (a+1)

    By ExistsElim Goal Using y = (a+1)
    ⊢ p (a+1) ∧ q (a+1)

    QED Asm 12


    -- PREVIOUS ATTEMPT AT SOLUTION, BRUHUHUH
    -- By ImplElim Goal
    -- Asm 6: ∀ (x : ℕ), p x
    -- ⊢ ∃ (y : ℕ), p y ∧ q y

    -- By ExistsElim Asm 2
    -- Asm 7: Var (x : ℕ)
    -- Asm 8: ¬ (p x)

    -- By ExistsElim Goal Using 4
    -- ⊢ p 4 ∧ q 4

    -- By AndElim Goal {
    --     Subproof 1: "prove p 4"
    --         ⊢ p 4

    --         By ForallElim Asm 6 Using x = 4
    --         Asm 1/1: p 4
    --         QED Asm 1/1

    --     -----------------------------------
    --     Subproof 2: "prove q 4"
    --         ⊢ q 4

    --         By ForallElim Asm 5 Using y = 3
    --         Asm 2/1: p 3 → q 4

    --         By ForallElim Asm 6 Using x = 3
    --         Asm 2/2: p 3

    --         By ImplElim Asm 2/1 Using Asm 2/2
    --         Asm 2/3: q 4

    --         QED Asm 2/3
    -- }
