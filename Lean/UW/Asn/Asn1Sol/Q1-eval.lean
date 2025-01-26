import UW

/- Marking rules
  3 marks  : correct answer
  2 marks  : Q1c only:  justification should be improved
               - justification is incomplete
               - justification has logica flaws
               - difficult to understand
               - overly long
  1 mark   : incorrect answer
  0   marks: unanswered
 -/
-----------------------------------------------------------------------
-- **Q1 SOLUTION**
--
/- **Q1a: Find a satisfying environment for the proposition Q1a**
   * In the Eval line below, replace each occurence of X *
   * with true or false *
-/

variable (p q r s : Prop)

Def X := true

Def Q1a := (p → (q ∨ r)) → (¬ p ∧ q ∧ ¬ r)

-- satisfying environments
Eval Q1a (p:=false) (q:=true) (r:=false)
Eval Q1a (p:=true) (q:=false) (r:=false)

-- counterexamples (not part of expected answer)
Eval Q1a (p:=false) (q:=false) (r:=false)
Eval Q1a (p:=false) (q:=false) (r:=true)
Eval Q1a (p:=false) (q:=true) (r:=true)
Eval Q1a (p:=true) (q:=false) (r:=true)
Eval Q1a (p:=true) (q:=true) (r:=false)
Eval Q1a (p:=true) (q:=true) (r:=true)

/- **Q1b: Find a counterexample for the proposition Q1b**
   * In the Eval line below, replace each occurence of X *
   * with true or false *
-/

Def Q1b := p ∧ ¬ q ∧ ¬ r ∧ s → ¬ p ∨ q ∨ r ∨ ¬ s

-- There is only one counterexample:
Eval Q1b (p:=true) (q:=false) (r:=false) (s:=true)

-- All possible environments (not part of expected answer)
Eval Q1b (p:=false) (q:=false) (r:=false) (s:=false)
Eval Q1b (p:=false) (q:=false) (r:=false) (s:=true )
Eval Q1b (p:=false) (q:=false) (r:=true ) (s:=false)
Eval Q1b (p:=false) (q:=false) (r:=true ) (s:=true )
Eval Q1b (p:=false) (q:=true ) (r:=false) (s:=false)
Eval Q1b (p:=false) (q:=true ) (r:=false) (s:=true )
Eval Q1b (p:=false) (q:=true ) (r:=true ) (s:=false)
Eval Q1b (p:=false) (q:=true ) (r:=true ) (s:=true )
Eval Q1b (p:=true ) (q:=false) (r:=false) (s:=false)
Eval Q1b (p:=true ) (q:=false) (r:=false) (s:=true ) -- CEX
Eval Q1b (p:=true ) (q:=false) (r:=true ) (s:=false)
Eval Q1b (p:=true ) (q:=false) (r:=true ) (s:=true )
Eval Q1b (p:=true ) (q:=true ) (r:=false) (s:=false)
Eval Q1b (p:=true ) (q:=true ) (r:=false) (s:=true )
Eval Q1b (p:=true ) (q:=true ) (r:=true ) (s:=false)
Eval Q1b (p:=true ) (q:=true ) (r:=true ) (s:=true )


/- **Q1c: How many counterexamples are there for the proposition Q1b?**

   * In the definition of Q1c, replace Y with a number. *
   * For full marks, you must justify your answer in the comment below *
-/

Def Y := -1

Def Q1c := 1

/-
  *  Write your justification here *
   (p ∧ ¬ q ∧ ¬ r ∧ s) → (¬ p ∨ q ∨ r ∨ ¬ s) must evaluate to false, this means that:
     - p ∧ ¬ q ∧ ¬ r ∧ s must evaluate to true
        - p must be true
        - q must be false
        - r must be false
        - s must be true
     - ¬ p ∨ q ∨ r ∨ ¬ s must evaluate to false
        - this is the same situation as the lhs of →
   each variable has only 1 possible value, therefore there is only one counterexample
-/
