import UW

/- Marking rules
     3 marks  : logically correct and minimal
     2.5 marks: logically correct and almost minimal
     2 marks  : logically correct but not minimal
     1 mark   : good attempt at an answer (demonstrates significant knowledge)
     0 marks  : unanswered
 -/

Var (a b c d e : Prop)

/-
 * Q2a: Using operators from the set { ∧, ∨, ¬ },
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * the variable `a` is `True` and at least one of `b`, `c`, or `d` is `True`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2a := a ∧ (b ∨ c ∨ d)

/-
 * Q2b: Using operators from the set { ∧, ∨, ¬, →, ⊕ },
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * *exactly* 3 variables from the set {a, b, c, d} are true.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2b1 := a ∧ b ∧ (c ⊕ d )  ∨  c ∧ d ∧ (a ⊕ b)                  --  7 operators
Def Q2b2 := a ∧ ((b ∧ (c ⊕ d )) ∨ (¬b ∧ c ∧ d)) ∨ ¬ a ∧ b ∧ c ∧ d -- 12 operators
Def Q2b3 := a ∧ b ∧ c ∧ ¬d  ∨  a ∧ b ∧ ¬ c ∧ d  ∨  a ∧ ¬b ∧ c ∧ d  ∨  ¬ a ∧ b ∧ c ∧ d  -- 19 operators
/-
/-
/-
/-
 * Q2c: Using operators from the set { ∧, ∨, ¬, →, ⊕ },
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * *at least* 2 variables from the set {a, b, c, d} are true.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2c1     := (a ∧ (b ∨ c ∨ d)) ∨ (b ∧ (c ∨ d)) ∨ (c ∧ d)

/-
 * Q2d: Using operators from the set { ∧, ∨, ¬, →, ⊕ },
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * an *odd number* of variables from the set {a, b, c, d} are true.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2d := a ⊕ b ⊕ c ⊕ d


/-
 * Q2e: Using operators from the set { ∧, ∨, ¬, →, ⊕ },
 * write a propositional logic expression that is *false* if-and-only-if (iff)
 * `a` is `False` and `b` is `True`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2e := b → a
