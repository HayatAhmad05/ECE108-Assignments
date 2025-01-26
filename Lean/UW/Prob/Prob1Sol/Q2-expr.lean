import UW

Var (a b c d e : Prop)

/-
 * Q2a1: Using operators from the set { ∧, ∨, ¬ } and optionally parentheses,,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * none of the variables {a,b,c,d,e} is `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2a1 := ¬(a ∨ b ∨ c ∨ d ∨ e)

Eval Q2a1 (a:=false) (b:=false) (c:=false) (d:=false) (e:=false)
Eval Q2a1 (a:=false) (b:=false) (c:=false) (d:=false) (e:=true)

/-
 * Q2a2: Using operators from the set { ∧, ∨, ¬ } and optionally parentheses,,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * none of the variables {a,b,c,d,e} is `false`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2a2 := (a ∧ b ∧ c ∧ d ∧ e)


Eval Q2a2 (a:=false) (b:=false) (c:=false) (d:=false) (e:=false)
Eval Q2a2 (a:=true ) (b:=false) (c:=false) (d:=false) (e:=false)
Eval Q2a2 (a:=true ) (b:=true ) (c:=true ) (d:=true ) (e:=true )

/-
 * Q2b1: Using operators from the set { ∧, ∨, ¬ } and optionally parentheses,,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * at least one of the variables {a,b,c} is `true` and
 * at least one of the varaibles {d,e} is `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2b1 := (a ∨ b ∨ c) ∧ (d ∨ e)

Eval Q2b1 (a:=false) (b:=false) (c:=false) (d:=false) (e:=false)
Eval Q2b1 (a:=true ) (b:=false) (c:=true ) (d:=false) (e:=false)
Eval Q2b1 (a:=false) (b:=false) (c:=false) (d:=false) (e:=true )
Eval Q2b1 (a:=false) (b:=false) (c:=true ) (d:=false) (e:=true )
Eval Q2b1 (a:=true ) (b:=true ) (c:=true ) (d:=true ) (e:=true )

/-
 * Q2b2: Using operators from the set { ∧, ∨, ¬  and optionally parentheses,},
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * at least one of the variables {a,b,c} is `false` and
 * at least one of the variables {d,e} is `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2b2 := ¬(a ∧ b ∧ c) ∧ (d ∨ e)

Eval Q2b2 (a:=false) (b:=false) (c:=false) (d:=false) (e:=false)
Eval Q2b2 (a:=false) (b:=false) (c:=false) (d:=true ) (e:=false)

/-
 * Q2c: Using operators from the set { ∧, ∨, ¬, →, ⊕ } and optionally parentheses,
 * write a propositional logic expression that is *false* if-and-only-if (iff)
 * all of the variables {a,b,c} are `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2c := ¬(a ∧ b ∧ c)

Eval Q2c (a:=false) (b:=false) (c:=false)
Eval Q2c (a:=true ) (b:=true ) (c:=true )

/-
 * Q2d: Using operators from the set { ∧, ∨, ¬, →, ⊕ } and optionally parentheses,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * exactly one of the variables {a,b} is `true`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2d := a ⊕ b

Eval Q2d (a:=false) (b:=false)
Eval Q2d (a:=false) (b:=true )

/-
 * Q2e: Using operators from the set { ∧, ∨, ¬, →, ⊕ } and optionally parentheses,
 * write a propositional logic expression that is *true* if-and-only-if (iff)
 * `a` is `true` or `b` is `false`.
 *
 * **Write the expression using the minimum number of operators.**
 *
-/

Def Q2e := b → a

Eval Q2e (a:=false) (b:=false)
Eval Q2e (a:=false) (b:=true )
Eval Q2e (a:=true ) (b:=false)
Eval Q2e (a:=true ) (b:=true )
