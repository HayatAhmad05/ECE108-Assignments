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

  By ImplElim Goal
  Asm 5: ∀ (x : Ty), p x
  ⊢ ∃ (y : Ty), q y
  By ImplElim Asm 1 Using Asm 5
  Asm 6: ∃ (x : Ty), r x
  By ExistsElim Asm 6
  Asm 7: Var (x1 : Ty)
  Asm 8: r x1
  By ForallElim Asm 4 Using x = x1, Asm 8
  Asm 9: r (g x1)
  By ForallElim Asm 3 Using g x = x1
  Asm 10: r (g x1) → q (x1)
  By ImplElim Asm 10 Using Asm 9
  Asm 11: q x1
  By ExistsElim Goal Using y = x1
  ⊢ q x1
  QED Asm 11
