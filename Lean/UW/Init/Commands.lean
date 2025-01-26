import Lean


macro mods:declModifiers "Def" n:declId sig:optDeclSig ":=" val:term : command =>
  `( $mods:declModifiers abbrev $n $sig := $val)

macro "Eval" val:term : command =>
  `( #eval $val)

macro "Check" val:term : command =>
  `( #check $val)

-- macro "Var" sig:declSig : command =>
--   `(variable $sig)

macro "Var" sig:bracketedBinder : command =>
  `(variable $sig)


Def foox : Prop := 3 + 1 > 2

Def foo3 : Nat := 3 + 4

Def foo4 (n:Nat) := n + 1

Def foo5 n := n + 1

Eval foo5 7

Var (n : Nat)

Var (n1 n2 : Nat)

Def foo : Prop := n1 > n2
