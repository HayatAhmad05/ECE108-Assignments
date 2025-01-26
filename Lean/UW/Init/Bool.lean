import UW.Init.Abbrevs
import UW.Init.List
set_option linter.unusedVariables false

open List

@[inherit_doc] infixl:30 " ^^ " => xor

-- convert a Bool (bit) to a Nat
abbrev b2n : Bool → Nat
  | false => 0
  | true  => 1

-- convert a bit vector to a Nat
abbrev bv2n : (List Bool) → ℕ
  | [] => 0
  | (b::bv) => (b2n b) * 2^(size bv) + bv2n bv

-- convert a Nat to a bit (everything that is not 0 is true)
abbrev n2b : ℕ → Bool
  | 0   => false
  | n+1 => true
