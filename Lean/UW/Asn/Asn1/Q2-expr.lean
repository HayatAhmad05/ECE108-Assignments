import UW

Var (a b c d e : Prop)

/-
 * Q2a: Using operators from the set { ∧, ∨, ¬ } and optionally parentheses,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * the variable `a` is `True` and at least one of `b`, `c`, or `d` is `True`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2a := a ∧ (b ∨ c ∨ d)

/-
 * Q2b: Using operators from the set { ∧, ∨, ¬, →, ⊕ }, and optionally parentheses
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * *exactly* 3 variables from the set {a, b, c, d} are true.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2b := (a ⊕ b ⊕ c ⊕ d) ∧ ((a ∧ b ∧ c) ∨ (a ∧ c ∧ d) ∨ (a ∧ b ∧ d) ∨ (b ∧ c ∧ d))

/-
 * Q2c: Using operators from the set { ∧, ∨, ¬, →, ⊕ } and optionally parentheses,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * *at least* 2 variables from the set {a, b, c, d} are true.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2c := (a ∧ b) ∨ ((a ∨ b) ∧ (c ∨ d)) ∨ (c ∧ d)

Eval Q2c (a := False) (b := False) (c := False) (d := False)

/-
 * Q2d: Using operators from the set { ∧, ∨, ¬, →, ⊕ } and optionally parentheses,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * an *odd number* of variables from the set {a, b, c, d} are true.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2d := a ⊕ b ⊕ c ⊕ d


/-
 * Q2e: Using operators from the set { ∧, ∨, ¬, →, ⊕ } and optionally parentheses,
 * write a propositional logic expression that is *false* if-and-only-if (iff)
 * `a` is `False` and `b` is `True`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2e := b → a
