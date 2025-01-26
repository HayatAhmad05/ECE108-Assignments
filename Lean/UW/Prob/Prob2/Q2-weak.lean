-----------------------------------------------------------------------
-- *Q2: Weaker, equal, stronger, incomparable*

variable (p q r s : Prop)

variable (weaker equal stronger incomparable : Prop)
variable ( X : Prop)

--
-- For each pair of formulas below, determine if the first formula is
-- weaker, equal, stronger, or incomparable to the second formula.
-- Replace `X` with one of {`weaker`, `equal`, `stronger`, `incomparable`}

-- *Q2a:* compare Q2a1 and Q2a2
abbrev Q2a1 := (p ∨ ¬ q)
abbrev Q2a2 := ¬ ( ¬ p ∧ q)

abbrev Q2a1_to_Q2a2 := X

----------------------------------------------------------------------

-- *Q2b:* compare Q2b1 and Q2b2
abbrev Q2b1 := (p ∨ ¬ q)
abbrev Q2b2 := ( ¬ p ∧ q)

abbrev Q2b1_to_Q2b2 := X

----------------------------------------------------------------------
-- *Q2c:* compare Q2c1 and Q2c2

abbrev Q2c1 := (p ∨ ¬ q)
abbrev Q2c2 := p

abbrev Q2c1_to_Q2c2 := X

----------------------------------------------------------------------
-- *Q2d:* compare Q2d1 and Q2d2

abbrev Q2d1 := (p ∨ ¬ q)
abbrev Q2d2 := true

abbrev Q2d1_to_Q2d2 := X
