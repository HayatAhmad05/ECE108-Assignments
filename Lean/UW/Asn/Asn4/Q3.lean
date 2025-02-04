-----------------------------------------------------------------------
-- **Q3**
-----------------------------------------------------------------------

import UW

/-
 * Complete the proof below
 -/

Var (Ty : Type)
Var (p q : Ty → Ty → Prop)
Var (s u : Ty → Prop)
Var (g : Ty → Ty)

Def Q3 := Proof
    Asm 1: ∀ (x : Ty), ∃ (y : Ty), p x y → q x y
    Asm 2: ∀ (x y : Ty), p x y → ∃ (x : Ty), q x y
    Asm 3: (∃ (x y : Ty), p x y) ∧ (∃ (x y : Ty), q x y)
    Asm 4: ∀ (x : Ty), (∀ (y: Ty), ¬ (p x y)) ∨ ∀ (y : Ty), q x y
    Asm 5: ∀ (x : Ty), ∃ (y : Ty), p x y
    Asm 6: ∃ (x : Ty), ∀ (y : Ty), p x y
    ⊢ ∃ (x y : Ty), p x y ∧ q x y

    -- prove p x y (turn into p a b)
    By ExistsElim Asm 6
    Asm 7: Var (a : Ty)
    Asm 8: ∀ (y : Ty), p a y

    By ForallElim Asm 5 Using x = a
    Asm 9: ∃ (y : Ty), p a y

    By ExistsElim Asm 9
    Asm 10: Var (b : Ty)
    Asm 11: p a b

    By ExistsElim Goal Using x = a, y = b
    ⊢ p a b ∧ q a b

    -- prove q a b

    By ForallElim Asm 4 Using x = a
    Asm 12: (∀ (y: Ty), ¬ (p a y)) ∨ ∀ (y : Ty), q a y

    By OrElim Asm 12 {
        Subproof 1: "assume lhs: ∀ (y: Ty), ¬ (p a y)"
            Asm 1/1: ∀ (y: Ty), ¬ (p a y)
            By ForallElim Asm 1/1 Using y = b
            Asm 1/2: ¬ (p a b)
            QED Contradiction Asm 11, Asm 1/2

        --------------------------------------------
        Subproof 2: "assume rhs: ∀ (y : Ty), q a y"
            Asm 2/1: ∀ (y : Ty), q a y
            By ForallElim Asm 2/1 Using y = b
            Asm 2/2: q a b
            By AndIntro Asm 11, Asm 2/2
            Asm 2/3: p a b ∧ q a b
            QED Asm 2/3
    }
