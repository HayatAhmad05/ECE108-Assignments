import UW

/-
 * Prove that formula p → q → (p ∧ q) is a tautology
 -/

Var ( p q : Prop)

-- Proof option 1: use just elim rules

Def Q5a := Proof
  ⊢ p → q → (p ∧ q)
  By ImplElim Goal
  Asm 1: p
  ⊢ q → (p ∧ q)
  By ImplElim Goal
  Asm 2: q
  ⊢ p ∧ q
   By AndElim Goal
   { Subproof 1: "lhs of ∧"
     ⊢ p
     QED Asm 1
     Subproof 2: "rhs of ∧"
     ⊢ q
     QED Asm 2
   }


-- Proof option 2: use intro rules
   -- intro ruls are optional, they might make
   -- a proof shorter, but you can do all proofs
   -- without any intro rules

Def Q5b := Proof
   Asm 1: p
   Asm 2: q
   ⊢ p ∧ q
   By AndIntro Asm 1, Asm 2
   Asm 3: p ∧ q
   QED Asm 3
