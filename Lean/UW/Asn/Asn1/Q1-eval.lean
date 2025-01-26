import UW

-----------------------------------------------------------------------
-- **Q1**
--
/- **Q1a: Find a satisfying environment for the proposition Q1a**
   * In the Eval line below, replace each occurence of X *
   * with True or False *
-/

Var (p q r s : Prop)

Def X := True

Def Q1a := (p → (q ∨ r)) → (¬ p ∧ q ∧ ¬ r)

Eval Q1a (p:=False) (q:=True) (r:=False)

/- **Q1b: Find a counterexample for the proposition Q1b**
   * In the Eval line below, replace each occurence of X *
   * with true or false *
-/

Def Q1b := p ∧ ¬ q ∧ ¬ r ∧ s → ¬ p ∨ q ∨ r ∨ ¬ s

Eval Q1b (p:=True) (q:=False) (r:=False) (s:=True)


/- **Q1c: How many counterexamples are there for the proposition Q1b?**

   * In the definition of Q1c, replace Y with a number. *
   * For full marks, you must justify your answer in the comment below*
-/

Def Y := 1

Def Q1c := Y

/-
  *  Write your justification here *

   (p ∧ ¬ q ∧ ¬ r ∧ s) → (¬ p ∨ q ∨ r ∨ ¬ s)
   implication is only false when LHS is true and RHS is false

   therefore:
   (p ∧ ¬ q ∧ ¬ r ∧ s) is true
   (¬ p ∨ q ∨ r ∨ ¬ s) is false

   for RHS to be true, p = True, ¬q = False, ¬r = False, s = True
   this is the onle case for LHS to be true
   it is also the only case for RHS to be false

   Because there is one case where LHS is true and RHS is false,
   there is one counterexample for Q1b
-/
