abbrev existsOne [DecidableEq α] ( p : α → Prop) : Prop :=
  ∃ (x1 : α), p x1 ∧ ∀ (x2 : α), p x2 → x1 = x2

syntax "∃!" "(" ident ":" term ")" "," term : term

macro_rules
  | `( ∃! ($id:ident : $ty:term) , $prop ) => `( existsOne (fun ( $id : $ty ) => $prop))

-- #check ∃! (x:Nat), x > 3
