import UW

-----------------------------------------------------------------------
-- **Q1**
-----------------------------------------------------------------------

/-
 * For each of the formulas below, determine if
 * it is a tautology, if it is satisfiable, and if it is a contradiction.
 *
 * For each of the Q1_is_... Defs below, replace X with either True or False.
-/

Var (p q r : Prop)

Var ( X : Prop)

Def Q1a := p ∧ q → p ∨ q

Def Q1a_is_tautology     := true
Def Q1a_is_satisfiable   := true
Def Q1a_is_contradiction := false

----------------------------------------------------------------------

Def Q1b := ¬( p ∨ q) → ¬ p ∨ ¬ q

Def Q1b_is_tautology     := true
Def Q1b_is_satisfiable   := true
Def Q1b_is_contradiction := false

----------------------------------------------------------------------

Def Q1c := p ∧ q → ¬ (p → q)

Def Q1c_is_tautology     := false
Def Q1c_is_satisfiable   := true
Def Q1c_is_contradiction := false

----------------------------------------------------------------------

Def Q1d := ¬( p → q) ∨ ¬ p

Def Q1d_is_tautology     := false
Def Q1d_is_satisfiable   := true
Def Q1d_is_contradiction := false
