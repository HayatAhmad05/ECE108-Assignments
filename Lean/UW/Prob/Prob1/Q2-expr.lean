import UW

Var (a b c d e : Prop)

/-
 * Q2a1: Using operators from the set { ∧, ∨, ¬ } and optionally parentheses,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * none of the variables {a,b,c,d,e} is `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2a1 := a

Eval Q2a1 (a:=false) (b:=false) (c:=false) (d:=false) (e:=false)

/-
 * Q2a2: Using operators from the set { ∧, ∨, ¬ } and optionally parentheses,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * none of the variables {a,b,c,d,e} is `false`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2a2 := a


Eval Q2a2 (a:=false) (b:=false) (c:=false) (d:=false) (e:=false)

/-
 * Q2b1: Using operators from the set { ∧, ∨, ¬ } and optionally parentheses,,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * at least one of the variables {a,b,c} is `true` and
 * at least one of the varaibles {d,e} is `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2b1 := a

Eval Q2b1 (a:=false) (b:=false) (c:=false) (d:=false) (e:=false)

/-
 * Q2b2: Using operators from the set { ∧, ∨, ¬ },
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * at least one of the variables {a,b,c} is `false` and
 * at least one of the variables {d,e} is `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2b2 := a

Eval Q2b2 (a:=false) (b:=false) (c:=false) (d:=false) (e:=false)

/-
 * Q2c: Using operators from the set { ∧, ∨, ¬, →, ⊕ },
 * write a propositional logic expression that is *false* if-and-only-if (iff)
 * all of the variables {a,b,c} are `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2c := a

Eval Q2c (a:=false) (b:=false) (c:=false)

/-
 * Q2d: Using operators from the set { ∧, ∨, ¬, →, ⊕ },
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * exactly one of the variables {a,b} is `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2d := a

Eval Q2d (a:=false) (b:=false)

/-
 * Q2e: Using operators from the set { ∧, ∨, ¬, →, ⊕ },
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * `a` is `true` or `b` is `false`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2e := a

Eval Q2e (a:=false) (b:=false)
