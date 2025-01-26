set_option linter.unusedVariables false

variable {Ty : Type}

namespace List

abbrev push (x:α) (xs:List α) : List α := List.cons x xs

abbrev front [Inhabited α] (xs:List α) : α := List.head! xs

abbrev back [Inhabited α] : (xs:List α) → α
  | [] => panic! "back: empty list"
  | [x] => x
  | x::xs => back xs

abbrev pop (xs:List α) : List α := List.tail! xs

abbrev pop_push_thm := ∀ (x : Ty) (xs : List Ty) , pop (push x xs) = xs

abbrev front_push_thm [Inhabited Ty] := ∀ (x : Ty) (xs : List Ty) , front (push x xs) = x

abbrev empty (xs:List α) : Prop := List.isEmpty xs

-- abbrev size (xs:List α) : Nat := List.length xs
abbrev size : (List α) → Nat
  | [] => 0
  | x :: xs => 1 + size xs



abbrev splice : (List α) → (List α) → List α
  | [], ys => ys
  | x :: xs, ys => x :: splice xs ys


-- mem : executable, returns Bool, requires BEq
abbrev memBool := @List.elem

-- mem as a Prop
abbrev mem : (x : α) → (xs : List α) → Prop
  | x, []       =>  false
  | x1, x2::xs  =>  x1 = x2 ∨ mem x1 xs

instance (x : α) (xs : List α) : Decidable (mem x xs) := sorry

/-
#check pop
#check splice
#check splice1
-/

end List

variable {Ty : Type}
macro "[Ty]" : term => `( ([] : List Ty) )
