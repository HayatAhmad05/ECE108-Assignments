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
    By ExistsElim Asm 1
    Asm 7: Var (y1 : Ty)
    Asm 8: ∀ (x : Ty), p x y1 → q x y1
    By ExistsElim Asm 6
    Asm 9: Var (x1 : Ty)
    Asm 10: ∀ (y : Ty), p x1 y
    By ForallElim Asm 2 Using y=y1, x=x1
    Asm 11: p x1 y1 → ∃ (x : Ty), q x y1
    By ImplElim Asm 11
    Asm 12: p x1 y1
    ⊢ ∃ (x : Ty), q x y1
    By ExistsElim Goal Using x=x1
    ⊢ q x1 y1
    By ForallElim Asm 8 Using x=x1, Asm 12
    Asm 13: q x1 y1
    QED Asm 13
