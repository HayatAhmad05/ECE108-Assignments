import UW

-----------------------------------------------------------------------
-- **Q5 More Formalization**
-----------------------------------------------------------------------

Var ( replace_this_variable_with_your_answer  : Prop )

/-
 * *Q4a* Formalize the sentence: "If you want to know what a [person]
 *       is like, take a good look at how [they] treat [their] inferiors,
 *       not [their] equals"
 *
 *       From Harry Potter and the Goblet of Fire by J.K. Rowling
 -/

 Var (know      : Prop) -- you want to know what a person is like
 Var (inferiors : Prop) -- look at how they treat their inferiors
 Var (equals    : Prop) -- look at how they treat their equals

 Def Q5 := know → (inferiors ∧ ¬ equals)
