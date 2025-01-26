-----------------------------------------------------------------------
-- *Q2: Weaker, equal, stronger, incomparable*

variable (p q r s : Prop)
--
-- For each pair of formulas below, determine if the first formula is
-- weaker, equal, stronger, or incomparable to the second formula.

-- *Q2a:* compare Q2a1 and Q2a2
abbrev Q2a1 := (p ∨ ¬ q)
abbrev Q2a2 := ¬ ( ¬ p ∧ q)

#eval Q2a1 (p:=false) (q:=false) -- true
#eval Q2a2 (p:=false) (q:=false) -- true

#eval Q2a1 (p:=false) (q:=true)  -- false
#eval Q2a2 (p:=false) (q:=true)  -- false

#eval Q2a1 (p:=true) (q:=false)  -- true
#eval Q2a2 (p:=true) (q:=false)  -- true

#eval Q2a1 (p:=true) (q:=true)   -- true
#eval Q2a2 (p:=true) (q:=true)   -- true

/-
  p   q  | p ∨ ¬ q    ¬ ( ¬ p ∧ q)
  -------+-----------
  F   F  |   T     ↔     T
  F   T  |   F     ↔     F
  T   F  |   T     ↔     T
  T   T  |   T     ↔     T
 -/

-- *Answer:* Q2a1 is equivalent to Q2a2

----------------------------------------------------------------------

-- *Q2b:* compare Q2b1 and Q2b2
abbrev Q2b1 := (p ∨ ¬ q)
abbrev Q2b2 := ( ¬ p ∧ q)

#eval Q2b1 (p:=false) (q:=false) -- true
#eval Q2b2 (p:=false) (q:=false) -- false

#eval Q2b1 (p:=false) (q:=true)  -- false
#eval Q2b2 (p:=false) (q:=true)  -- true

#eval Q2b1 (p:=true) (q:=false)  -- true
#eval Q2b2 (p:=true) (q:=false)  -- false

#eval Q2b1 (p:=true) (q:=true)   -- true
#eval Q2b2 (p:=true) (q:=true)   -- false

/-
  p   q  | p ∨ ¬ q    ¬p ∧ q)
  -------+-----------
  F   F  |   T     ←     F
  F   T  |   F     →     T
 -/
-- *Answer:* Q2b1 is incomparable Q2b1

----------------------------------------------------------------------
-- *Q2c:* compare Q2c1 and Q2c2

abbrev Q2c1 := (p ∨ ¬ q)
abbrev Q2c2 := p

#eval Q2c1 (p:=false) (q:=false) -- true
#eval Q2c2 (p:=false)            -- false

#eval Q2c1 (p:=false) (q:=true)  -- false
#eval Q2c2 (p:=false)            -- false

#eval Q2c1 (p:=true) (q:=false)  -- true
#eval Q2c2 (p:=true)             -- true

#eval Q2c1 (p:=true) (q:=true)   -- true
#eval Q2c2 (p:=true)             -- true

/-
  p   q  | p ∨ ¬ q    ¬ ( ¬ p ∧ q)
  -------+-----------
  F   F  |   T     ←     F
  F   T  |   F     ↔     F
  T   F  |   T     ↔     T
  T   T  |   T     ↔     T
 -/

-- *Answer:* Q2c1 is weaker Q2c1

----------------------------------------------------------------------
-- *Q2d:* compare Q2d1 and Q2d2

abbrev Q2d1 := (p ∨ ¬ q)
abbrev Q2d2 := true

-- *Answer:* Q2d1 is stronger Q2d1
