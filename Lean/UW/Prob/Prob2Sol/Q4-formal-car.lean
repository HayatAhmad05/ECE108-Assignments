import UW

-----------------------------------------------------------------------
-- **Q4 More Formalization**
-----------------------------------------------------------------------

Var ( replace_this_variable_with_your_answer  : Prop )

/-
 * *Q4a* Formalize the sentence: "If the red light is on whenever the cars’s
 * speed exceeds 60 kph, then driving the car on surface streets is necessary
 * for the red light to be off.
-/

Var (red : Prop  ) -- the red light is on
Var (fast : Prop ) -- the car's speed exceed 60kph
Var (sfc : Prop  ) -- the car is driving on a surface street

Def Q4 := (fast ∧ red) → (¬ red → sfc)
