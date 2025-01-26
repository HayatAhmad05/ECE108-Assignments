macro "ℕ" : term => `( Nat )


abbrev xorProp (a b : Prop) : Prop := (¬ a ∧ b) ∨ (a ∧ ¬ b)

infixr:30 " ⊕ "  => xorProp
