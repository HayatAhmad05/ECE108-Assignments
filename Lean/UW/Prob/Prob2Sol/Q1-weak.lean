import UW
-----------------------------------------------------------------------
-- **Q1**
-----------------------------------------------------------------------

Var (p q : Prop)

Var (weaker equal stronger incomparable : Prop)
Var ( X : Prop)
/-
 * For each of the pairs of formulas below, determine if the first formula is
 * weaker, equal, stronger, or incomparable to the second formula.
 *
 * Replace each X below with one of weaker, equal, stronger, or incomparable
 -/

-- *Q1a:* compare Q1a1 and Q1a2

Def Q1a1 := p
Def Q1a2 := p → q

Def Q1a1_to_Q1a2 := incomparable

/-
  p   q  | p    p→q
  -------+---------
  F   F  | F →   T
  T   F  | T ←   F
 -/

----------------------------------------------------------------------

-- *Q1b:* compare Q1b1 and Q1b2

Def Q1b1 := q
Def Q1b2 := p → q

Def Q1b1_to_Q1b2 := stronger

/-
  p → q is equivalent to ¬p ∨ q, which is a superset of just q

  p   q  | q    p→q
  -------+---------
  F   F  | F →   T
  F   T  | T ↔   T
  T   F  | F ↔   F
  T   T  | T ↔   T
 -/

----------------------------------------------------------------------
-- *Q1c:* compare Q1c1 and Q1c2

Def Q1c1 := p ∧ q
Def Q1c2 := p → q

Def Q1c1_to_Q1c2 := stronger

/-
  p → q is a superset of p ∧ q

  p   q  | p∧q    p→q
  -------+-----------
  F   F  | F   →   T
  F   T  | F   →   T
  T   F  | F   ↔   F
  T   T  | T   ↔   T
 -/
----------------------------------------------------------------------
-- *Q1d:* compare Q1d1 and Q1d2

Def Q1d1 := ¬ p ∨ q
Def Q1d2 := p → q

Def Q1d1_to_Q1d2 := equal

/-
 p → q is equivalent to ¬p ∨ q
 -/
----------------------------------------------------------------------
-- *Q1e:* compare Q1e1 and Q1e2

Def Q1e1 := p ∨ q
Def Q1e2 := p → q

Def Q1e1_to_Q1e2 := incomparable

/-
  p   q  | p∨q    p→q
  -------+-----------
  F   F  | F   →   T
  T   F  | T   ←   F

