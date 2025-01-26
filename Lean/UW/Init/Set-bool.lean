set_option linter.unusedVariables false

/-
structure Foo (α : Type ) where
  val : α
  bEq : BEq α

def prod (x: Foo α) (y: Foo β) :=
  Foo.mk (x.val,y.val) ()
-/

structure Set (α : Type) where
  val : List α
  bEq : BEq α

def make   [BEq α] (xs : List α) := Set.mk xs (inferInstance : BEq α)

def auxSetToString [ToString α] (s : List α) : String :=
  match s with
    | []        => "}"
    | [x] => toString x ++ "}"
    | x::xs    => toString x ++ "," ++ auxSetToString xs

def setToString [ToString α] (xs:Set α) : String :=
  "{" ++ auxSetToString xs.val

-----------------------------------------------------------------------
def empty [BEq α] : Set α := Set.mk [] (inferInstance : BEq α)

/- finset has:
def [] : Finset α :=
  ⟨0, nodup_zero⟩
-/

-----------------------------------------------------------------------
def mem (x:α) (s:Set α) := @List.elem α (s.bEq) x s.val

-----------------------------------------------------------------------
def insert (x:α) (xs:Set α) : Set α :=
  if mem x xs then xs else Set.mk (x::xs.val) (xs.bEq)

-----------------------------------------------------------------------
-- list functions
-----------------------------------------------------------------------

def unionList [BEq α]: (xs : List α) → (ys: List α) → List α
  | [], ys => ys
  | x::xs, ys => if List.elem x ys then unionList xs ys else x :: (unionList xs ys)

def interList [BEq α] : (xs : List α) → (ys: List α) → List α
  | [], ys => []
  | x::xs, ys => if List.elem x ys then x :: (interList xs ys) else interList xs ys

def delList [BEq α] : (x : α) → (ys: List α) → List α
  | x, [] => []
  | x, y :: ys => if x == y then ys else y :: (delList x ys)

def minusList [BEq α] : (xs : List α) → (ys: List α) → List α
  | xs, [] => xs
  | xs, y::ys => delList y (minusList xs ys)

-----------------------------------------------------------------------
def allList [BEq α] : (α → Bool) → (xs : List α) → Bool
  | p, []    => true
  | p, x::xs => p x && allList p xs

def someList [BEq α] : (α → Bool) → (xs : List α) → Bool
  | p, []    => false
  | p, x::xs => p x || someList p xs

-----------------------------------------------------------------------
def subseteqList [BEq α] : (xs : List α) → (ys: List α) → Bool
  | [], ys => true
  | x::xs, ys => List.elem x ys && subseteqList xs ys

def subsetList [BEq α]  (xs : List α) (ys: List α) : Bool :=
  subseteqList xs ys && someList (fun x => not (List.elem x ys)) xs

def equalList [BEq α]  (xs : List α) (ys: List α) : Bool :=
  subseteqList xs ys && subseteqList ys xs

-----------------------------------------------------------------------
def sizeList {α : Type} : (xs : List α) → Nat
  | [] => 0
  | x::xs => 1 + sizeList xs

-----------------------------------------------------------------------
-- product

def auxProdList : (x : α) → (ys: List β) → List (α × β)
  | x, [] => []
  | x, y :: ys => (x,y) :: (auxProdList x ys)

def productList [BEq α] [BEq β]: (xs : List α) → (ys: List β) → List (α × β)
  | [], ys => []
  | x::xs, ys => unionList (auxProdList x ys) (productList xs ys)

-----------------------------------------------------------------------
-- filter

def filterList : (g: α → Bool) → (s: List α) → List α
  | g, [] => []
  | g, x::xs => if g x then x :: (filterList g xs) else filterList g xs

-----------------------------------------------------------------------
-- image

def imageList [BEq β]: (g: α → β) → (s : List α) → Set β
  | g, []    => @Set.mk β [] (inferInstance : BEq β)
  | g, x::xs => insert (g x) (imageList g xs)

def image [BEq β] (g: α → β) (s : Set α) : Set β := imageList g s.val

-----------------------------------------------------------------------
-- lift list functions to sets
-----------------------------------------------------------------------

def lift1 (f : α → List α → List α) (x:α) (s2 : Set α) : Set α :=
  Set.mk (f x s2.val) s2.bEq

def lift2 (f : List α → List α → List α) (s1 s2 : Set α) : Set α :=
  Set.mk (f s1.val s2.val) s1.bEq

-----------------------------------------------------------------------

def union (xs ys : Set α):= lift2 (@unionList α xs.bEq) xs ys
def inter (xs ys : Set α):= lift2 (@interList α xs.bEq) xs ys
def del (x : α) (ys : Set α):= lift1 (@delList α ys.bEq) x ys
def minus (xs ys : Set α):= lift2 (@minusList α xs.bEq) xs ys
def all (p : α → Bool) (ys : Set α) := @allList α ys.bEq p ys.val
def some (p : α → Bool) (ys : Set α) := @someList α ys.bEq p ys.val
def subseteq (xs ys : Set α) := @subseteqList α xs.bEq xs.val ys.val
def subset   (xs ys : Set α) := @subsetList α xs.bEq xs.val ys.val
def equal    (xs ys : Set α) := @equalList α xs.bEq xs.val ys.val
def size (xs : Set α) := sizeList xs.val
def filter (p : α → Bool) (s : Set α) := Set.mk (filterList p s.val) (s.bEq)

/-
def prodEq : (α → α → Bool) → (β → β → Bool) → (α × β) → (α × β) → Bool
  | aeq, beq, (a1,b1), (a2,b2) => aeq a1 a2 && beq b1 b2

def prodEq2 : [BEq α] → [BEq β] → [BEq (α × β)]
  | aeq, beq, (a1,b1), (a2,b2) => aeq a1 a2 && beq b1 b2


--!!MDA: need to construct instance of BeQ for α × β

#check (fun (α:Type) (xs:Set α) => xs.bEq.beq)

instance [Inhabited a] [Inhabited b] : Inhabited (a × b) where
  default := (default, default)

instance : BEq (Set α) where
  beq := equal

instance : BEq (Set (α × β)) where
  beq := fun s1 s2 => true

instance

def product (xs : Set α) (ys: Set β) :=
  Set.mk
    (@productList α β xs.bEq ys.bEq xs.val ys.val)
    (fun (a1,b1) (a2,b2) => )

#check @BEq.beq (Set α)

def product2 (xs : Set α) (ys: Set β) :=
  Set.mk
    (@productList α β xs.bEq ys.bEq xs.val ys.val)
    (@BEq.beq fun a1b1 a2b2 => true)



#check (inferInstance : BEq Nat)
#check (inferInstance : BEq (Set (Nat × Nat)))
-/

-----------------------------------------------------------------------
-- instances

def myBoolToProp : Bool → Prop
  | true => True
  | false => False

instance : Membership α (Set α) where
  mem := fun x xs => myBoolToProp (mem x xs)

/-
instance [DecidableEq α] (x:α) (xs:Set α) : Decidable (x ∈ xs) := myBoolToProp (mem x xs)

instance [DecidableEq α] : DecidableEq (Set α) where
  eq := eq
-/

instance [ToString α] : ToString (Set α) where
  toString := setToString

instance : Union (Set α) where
  union := union

instance : Inter (Set α) where
  inter := inter

instance : Sub (Set α) where
  sub := minus

instance : Coe Bool Prop where
  coe b := b = true

-- /-!!MDA: if we use boolToProp, we lose ability to eval
instance : HasSubset (Set α) where
  Subset := fun xs ys => myBoolToProp (subseteq xs ys)

-- /-!!MDA: if we use boolToProp, we lose ability to eval
instance : HasSSubset (Set α) where
  SSubset := fun xs ys => myBoolToProp (subset xs ys)

instance [DecidableEq α]: HasSSubset (Set α) where
  SSubset := fun xs ys => myBoolToProp (subset xs ys)
-- -/

/-
macro_rules
  | `($xs:term " ⊆ " $ys:term ) => `( subseteq $xs $ys )

macro_rules
  | `($xs:term " ⊂ " $ys:term ) => `( subset $xs $ys )
-/

/-!!MDA
instance : HMul (Set α) (Set β) (Set (α × β)) where
  hMul := product
-/

-----------------------------------------------------------------------
-- {1,2,3} syntax

syntax (priority := high) "{" term,* "}" : term

--!MDA: should be able to simplify these rules
macro_rules
  | `( {} )                                => `( empty )
  | `( { $x:term } )                       => `( make [$x] )
  | `( { $x:term, $x2:term } )             => `( make [$x, $x2] )
  | `( { $x:term, $x2:term, $xs:term,* } ) => `( (insert $x ({ $x2, $xs,* }) ) )


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


def auxBigUnionList [BEq β]: (α → Set β) → (List α) → (Set β)
  | g, [] => empty
  | g, x::xs => union (g x) (auxBigUnionList g xs)

def auxBigUnion [BEq β] (g : α → Set β) (s : Set α) : (Set β) :=
  auxBigUnionList g s.val

-- #eval auxBigUnion (fun i => {i%2}) {1,2,3,4}

syntax "⋃" ident "∈" term "," term : term

macro_rules
  | `( ⋃ $id:ident ∈ $set:term , $body:term ) => `( auxBigUnion (fun $id => $body) $set )


-- #eval ⋃ i ∈ {1,2,3,4}, {i}
----------------------------------------------------------------------

syntax (priority := high+1) "{" ident "∈" term "," term "}" : term
syntax (priority := high+1) "{" ident "∈" term "," ident "∈" term "," term "}" : term
syntax (priority := high+1) "{" ident "∈" term "," ident "∈" term "," ident "∈" term "," term "}" : term
syntax (priority := high+1) "{" ident "∈" term "," ident "∈" term "," ident "∈" term "," ident "∈" term "," term "}" : term

macro_rules
  | `( { $id0:ident ∈ $S0:term , $pred:term } ) => `( filter (fun $id0 => $pred) $S0 )
  | `( { $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $pred:term } ) =>
        `( filter (fun ($id0,$id1) => $pred) (product $S0 $S1 ) )
  | `( { $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $id2:ident ∈ $S2 , $pred:term } ) =>
        `( filter (fun ($id0,$id1,$id2) => $pred) (product $S0 (product $S1 $S2) ))
  | `( { $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $id2:ident ∈ $S2 , $id3:ident ∈ $S3 , $pred:term } ) =>
        `( filter
            (fun ($id0,$id1,$id2,$id3) => $pred)
            (product $S0 (product $S1 (product $S2 $S3) )) )

--#eval { i ∈ {1,2,3}, i > 2}
--#eval { i ∈ {1,2,3}, j ∈ {"a", "b"}, i > 2} -- BAD: requires product

---------------------------------------------------------------------
--
syntax (priority := high) "{" term "|" ident "∈" term "," term "}" : term
syntax (priority := high) "{" term "|" ident "∈" term "," ident "∈" term "," term "}" : term
syntax (priority := high) "{" term "|" ident "∈" term "," ident "∈" term "," ident "∈" term "," term "}" : term
syntax (priority := high) "{" term "|" ident "∈" term "," ident "∈" term "," ident "∈" term "," ident "∈" term "," term "}" : term

macro_rules
  | `( { $res:term | $id0:ident ∈ $S0:term , $pred:term } ) =>
        `( image
            (fun $id0 => $res)
            (filter (fun $id0 => $pred) $S0 ))
  | `( { $res:term | $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $pred:term } ) =>
        `( image
            (fun ($id0,$id1) => $res)
            (filter
              (fun ($id0,$id1) => $pred)
              (product $S0 $S1 ) ) )
  | `( { $res:term | $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $id2:ident ∈ $S2 , $pred:term } ) =>
        `( image
            (fun ($id0,$id1,$id2) => $res)
            (filter
              (fun ($id0,$id1,$id2) => $pred)
              (product $S0 (product $S1 $S2) )) )
  | `( { $res:term | $id0:ident ∈ $S0:term , $id1:ident ∈ $S1:term , $id2:ident ∈ $S2 , $id3:ident ∈ $S3 , $pred:term } ) =>
        `( image
            (fun ($id0,$id1,$id2,$id3) => $res)
            (filter
              (fun ($id0,$id1,$id2,$id3) => $pred)
              (product $S0 (product $S1 (product $S2 $S3) )) ) )
