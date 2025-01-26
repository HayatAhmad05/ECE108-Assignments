import Lean
import UW.Init.Abbrevs
import UW.Init.List

set_option linter.unusedVariables false
open Lean


/-
structure Foo (α : Type ) where
  val : α
  DecidableEq : DecidableEq α

def prod (x: Foo α) (y: Foo β) :=
  Foo.mk (x.val,y.val) ()
-/

structure Set (α : Type) where
  mem : α → Prop

def fromList   [DecidableEq α] (xs : List α) :=
  Set.mk (fun x => List.mem x xs)

-----------------------------------------------------------------------
def empty : Set α := Set.mk (fun x => false)

def mem (x:α) (s:Set α) := s.mem x

def insert (x1 : α) (s : Set α) : Set α :=
  Set.mk (fun x2 => x1 = x2 ∨ mem x2 s)

-----------------------------------------------------------------------
-- **set builder**
-----------------------------------------------------------------------

-- simple sets, just enumerate the values

syntax (priority := high) "{" term,* "}" : term

macro_rules
  | `( {} )                      => `( empty )
  | `( { $x:term } )             => `( insert $x {})
  | `( { $x:term, $xs:term,* } ) => `( insert $x { $xs,* })

-----------------------------------------------------------------------
-- { x : Ty, p[x] }
-----------------------------------------------------------------------

syntax (priority := high+1) "{" ident ":" term "," term "}" : term
syntax (priority := high+1) "{" ident ":" term "," ident ":" term "," term "}" : term
syntax (priority := high+1) "{" ident ":" term "," ident ":" term "," ident ":" term "," term "}" : term
syntax (priority := high+1) "{" ident ":" term "," ident ":" term "," ident ":" term "," ident ":" term "," term "}" : term

macro_rules
  | `( { $id0:ident : $ty0:term , $pred:term } ) =>
        `( Set.mk (fun ($id0 :$ty0) => $pred) )
  | `( { $id0:ident : $ty0:term , $id1:ident : $ty1:term , $pred:term } ) =>
        `( Set.mk (fun (($id0 : $ty0), ($id1 : $ty1)) => $pred) )
  | `( { $id0:ident : $ty0:term , $id1:ident : $ty1:term , $id2:ident : $ty2 , $pred:term } ) =>
        `( Set.mk (fun (($id0 : $ty0), ($id1 : $ty1), ($id2 : $ty2)) => $pred) )
  | `( { $id0:ident ∈ $ty0:term , $id1:ident ∈ $ty1:term , $id2:ident ∈ $ty2 , $id3:ident ∈ $ty3 , $pred:term } ) =>
        `( Set.mk (fun (($id0 : $ty0), ($id1 : $ty1), ($id2 : $ty2), ($id3, $ty3)) => $pred) )

#check (fun (x:Nat) (y:Nat) => x * y)

#check { x : Nat, x > 3}

-----------------------------------------------------------------------
-- * { x ∈ S, p[x]}
-----------------------------------------------------------------------

syntax (priority := high+1) "{" ident "∈" term "," term "}" : term
syntax (priority := high+1) "{" ident "∈" term "," ident "∈" term "," term "}" : term
syntax (priority := high+1) "{" ident "∈" term "," ident "∈" term "," ident "∈" term "," term "}" : term
syntax (priority := high+1) "{" ident "∈" term "," ident "∈" term "," ident "∈" term "," ident "∈" term "," term "}" : term

macro_rules
  | `( { $id0:ident ∈ $S0:term , $pred:term } ) =>
        `( Set.mk (fun $id0 => mem $id0 $S0 ∧ $pred) )
  | `( { $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $pred:term } ) =>
        `( Set.mk (fun ($id0, $id1) => mem $id0 $S0 ∧ mem $id1 $S1 ∧ $pred) )
  | `( { $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $id2:ident ∈ $S2 , $pred:term } ) =>
        `( Set.mk (fun ($id0, $id1, $id2) =>
            mem $id0 $S0 ∧ mem $id1 $S1 ∧ mem $id2 $S2 ∧ $pred) )
  | `( { $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $id2:ident ∈ $S2 , $id3:ident ∈ $S3 , $pred:term } ) =>
        `( Set.mk (fun ($id0, $id1, $id2, $id3) =>
            mem $id0 $S0 ∧ mem $id1 $S1 ∧ mem $id2 $S2 ∧ mem $id3 $S3 ∧ $pred) )

/-
#check { i ∈ {1,2,3}, i > 2}
#check { i ∈ {1,2,3}, j ∈ {"a", "b"}, i > 2}
#check { i ∈ {1,2,3}, j ∈ {"a", "b"}, k ∈ {true,false}, i > 2 ∧ k}
-/

--#eval { i ∈ {1,2,3}, j ∈ {"a", "b"}, i > 2} -- BAD: requires product


-----------------------------------------------------------------------
instance : Membership α (Set α) where
  mem := mem
-----------------------------------------------------------------------

def union (xs ys : Set α) := { x : α, x ∈ xs ∨ x ∈ ys}
def inter (xs ys : Set α) := { x : α, x ∈ xs ∧ x ∈ ys}
def del (x : α) (ys : Set α) := {y ∈ ys, y ≠ x}

def minus (xs ys : Set α):= { x ∈ xs, ¬(x ∈ xs)}
def all  (p : α → Prop) (xs : Set α) := ∀ (x:α), x ∈ xs → p x
def some (p : α → Prop) (xs : Set α) := ∃ (x:α), x ∈ xs → p x
def subseteq (xs ys : Set α) := ∀ (x : α), x ∈ xs → x ∈ ys
def subset   (xs ys : Set α) := subseteq xs ys ∧ ∃ (x:α), x ∈ xs ∧ ¬(x ∈ ys)
def equal    (xs ys : Set α) := ∀ (x:α), x ∈ xs ↔ x ∈ ys
def size     (xs : Set α)    := 0 --!!MDA: fixme
def filter   (p : α → Bool) (s : Set α) := { x ∈ s, p x}

---------------------------------------------------------------------
--

syntax (priority := high) "{" term "|" ident "∈" term "," term "}" : term
syntax (priority := high) "{" term "|" ident "∈" term "," ident "∈" term "," term "}" : term
syntax (priority := high) "{" term "|" ident "∈" term "," ident "∈" term "," ident "∈" term "," term "}" : term
syntax (priority := high) "{" term "|" ident "∈" term "," ident "∈" term "," ident "∈" term "," ident "∈" term "," term "}" : term

macro_rules
  | `( { $res:term | $id0:ident ∈ $S0:term , $pred:term } ) =>
        `( Set.mk (fun z => some (fun $id0 => $pred ∧ (z = $res)) $S0) )

-- #check { (x^2,3) | x ∈ {0,1,2}, x > 2 }


/-
def prodEq : (α → α → Bool) → (β → β → Bool) → (α × β) → (α × β) → Bool
  | aeq, DecidableEq, (a1,b1), (a2,b2) => aeq a1 a2 && DecidableEq b1 b2

def prodEq2 : [DecidableEq α] → [DecidableEq β] → [DecidableEq (α × β)]
  | aeq, DecidableEq, (a1,b1), (a2,b2) => aeq a1 a2 && DecidableEq b1 b2


--!!MDA: need to construct instance of DecidableEq for α × β

#check (fun (α:Type) (xs:Set α) => xs.eq.eq)

instance [Inhabited a] [Inhabited b] : Inhabited (a × b) where
  default := (default, default)

instance : DecidableEq (Set α) where
  DecidableEq := equal

instance : DecidableEq (Set (α × β)) where
  DecidableEq := fun s1 s2 => true

instance

def product (xs : Set α) (ys: Set β) :=
  Set.mk
    (@productList α β xs.eq ys.eq xs.val ys.val)
    (fun (a1,b1) (a2,b2) => )

#check @DecidableEq.eq (Set α)

def product2 (xs : Set α) (ys: Set β) :=
  Set.mk
    (@productList α β xs.eq ys.eq xs.val ys.val)
    (@DecidableEq.eq fun a1b1 a2b2 => true)



#check (inferInstance : DecidableEq Nat)
#check (inferInstance : DecidableEq (Set (Nat × Nat)))
-/

-----------------------------------------------------------------------
-- instances

/-
instance [DecidableEq α] : DecidableEq (Set α) where
  eq := equal
-/

instance : Union (Set α) where
  union := union

instance : Inter (Set α) where
  inter := inter

instance : Sub (Set α) where
  sub := minus

instance : Coe Bool Prop where
  coe b := b = true

instance : HasSubset (Set α) where
  Subset := subseteq

instance : HasSSubset (Set α) where
  SSubset := subset


/-!!MDA
instance : HMul (Set α) (Set β) (Set (α × β)) where
  hMul := product
-/


macro (priority := high) "∅" : term => `( empty )


/-
#eval ({} : Set Nat)
#eval ({1} : Set Nat)
#eval ({1,2} : Set Nat)
-/

-----------------------------------------------------------------------
-- test
-----------------------------------------------------------------------
/-
#eval (cons 1 (cons 2 []) : Set Nat)

#eval ({1,2} : Set Nat)

#eval insert 1 (cons 2 [])

#eval insert 0 {1,2,3,4}

#eval mem 1 {1,2,3,4}
#eval mem 5 {1,2,3,4}

#eval union {1,2,3} {3,4,5}

#eval union {1,2,3} {3,3}

#eval {1,2,3} ∪ {3,3}
#eval {1,2,3} ∩ {3,3}
#eval {1,2,3} * {"a","b"}

#eval del 1 {1,2,3}
#eval del 3 {1,2,3}

#eval minus {1,2} {3}

#eval {1,2,3} - {1}
#eval {1,2,3} - {3}

#eval boolToProp (mem (cons 1 []) [])

#eval boolToProp true

#check {1,2,3} ⊆ {3}
#eval {1,2,3} ⊂ {3}

#eval {1,3,1} = {1}
-/
----------------------------------------------------------------------

-- #eval auxBigUnion (fun i => {i%2}) {1,2,3,4}

syntax "⋃" ident "∈" term "," term : term

macro_rules
  | `( ⋃ $id:ident ∈ $set:term , $body:term ) =>
      `( bigUnion (fun $id => $body) $set )

-- #check {1}

-- #check (⋃ x ∈ {1,2,3}, ({x} : Set Nat))

-- #eval ⋃ i ∈ {1,2,3,4}, {i}
----------------------------------------------------------------------

syntax "Sum" ident "∈" term "," term : term

--!!MDA: gross hack
abbrev sumSet (s:Set Ty) (g: Ty → ℕ) : ℕ := 0

macro_rules
  | `( Sum $id:ident ∈ $set:term , $body:term ) =>
    `( sumSet $set (fun $id => $body) ) --!!MDA
