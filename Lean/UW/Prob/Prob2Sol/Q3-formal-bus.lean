import UW
-----------------------------------------------------------------------
-- **Q3 Only Fun Formalization**
-----------------------------------------------------------------------

Var ( replace_this_variable_with_your_answer  : Prop )

/-
 * Formalize each of the sentences below
 -/

-- *Q3a:* "Aarti rides the bus to school only when it is raining."

Var (arbs rain : Prop)

/-
 * arbs := Aarti rides the bus to school
 * rain := It is raining
 -/
Def Q3a := arbs → rain

-- *Q3b:* Aarti rides the bus only to school when it is raining.

Var (bus school : Prop)

/-
 * bus    := Aarti rides the bus
 * school := Aarti goes to school
-/
Def Q3b := (rain ∧ bus) → school

-- *Q3c:* Aarti only rides the bus to school when it is raining.

Def Q3c := rain → arbs

-- *Q3d:* Aarti rides the bus to school when not only it is raining but also she is late.

Var ( late : Prop)

/-
 * late := Aarti is late
 -/

Def Q3d := (rain ∧ late → bus)
