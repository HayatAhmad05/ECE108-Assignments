import UW

Var ( replace_this_variable_with_your_answer  : Prop )

-----------------------------------------------------------------------
-- *Q3: Formalization*
--
-- Formalize each of the sentences below

-- *Q3a:* "If youth endures or beauty remains, and the soul corrupts,
--         then the portrait bears the burden."
--
--         From Picture of Dorian Gray by Oscar Wilde

Def Q3a := ((Y ∨ B) ∧ S) → P

-- *Q3b:* "You step onto the road, and if you don't keep your feet,
--         there's no knowing where you might be swept off to."
--
--         From The Lord of the Rings by J.R.R. Tolkein

Def Q3b := R ∧ (¬F → S)
