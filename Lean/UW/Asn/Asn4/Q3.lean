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
