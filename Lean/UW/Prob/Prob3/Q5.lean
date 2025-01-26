import UW

/-
 * Prove that formula p → q → (p ∧ q) is a tautology
 -/

Var ( p q : Prop)

-- Proof option 1: use just elim rules

Def Q5a := Proof
  ⊢ p → q → (p ∧ q)


-- Proof option 2: use intro rules
   -- intro ruls are optional, they might make
   -- a proof shorter, but you can do all proofs
   -- without any intro rules

Def Q5b := Proof
   Asm 1: p
   Asm 2: q
   ⊢ p ∧ q
