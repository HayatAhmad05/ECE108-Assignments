import UW
-----------------------------------------------------------------------
-- *Q1: Weaker, equal, stronger, incomparable*

Var (p q r s : Prop)

Var (weaker equal stronger incomparable : Prop)
Var ( X : Prop)

-- For each pair of formulas below, determine if the first formula is
-- weaker, equal, stronger, or incomparable to the second formula.
-- Replace `X` with one of {`weaker`, `equal`, `stronger`, `incomparable`}

-- Hint: look for optimizations (shortcuts) so that you do not have
--       to write out a complete truth table.

-- *Q1a:* compare Q1a1 and Q1a2
Def Q1a1 := p → q → r
Def Q1a2 := p ∧ q → r

Def Q1a1_to_Q1a2 := weaker

-- *Q1b:* compare Q1b1 and Q1b2
Def Q1b1 := p → r
Def Q1b2 := p ∧ q → r

Def Q1b1_to_Q1b2 : weaker

-- *Q1c:* compare Q1c1 and Q1c2
Def Q1c1 := p → r
Def Q1c2 := p → r ∧ s

Def Q1c1_to_Q1c2 := weaker

-- *Q1d:* compare Q1d1 and Q1d2
Def Q1d1 := p → r
Def Q1d2 := p → r ∨ s

Def Q1d1_to_Q1d2 := stronger
