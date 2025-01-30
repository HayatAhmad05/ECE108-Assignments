-----------------------------------------------------------------------
-- **Q2**
-----------------------------------------------------------------------

import UW

/-
 * Complete the proof below
 -/

Var (Ty : Type)
Var (p q r s u : Ty → Prop)
Var (g : Ty → Ty)

Def Q2 := Proof
  Asm 1: ∀ (x : Ty), p x → ∃ (x:Ty), r x
  Asm 2: (∀ (x : Ty), r x) → ∃ (y : Ty), q y
  Asm 3: ∀ (x : Ty), r (g (g x)) → q (g x)
  Asm 4: ∀ (x: Ty), r x → r (g x)
  ⊢ ∀ (x : Ty), p x → ∃ (y: Ty), q y
