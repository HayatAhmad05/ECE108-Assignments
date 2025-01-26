import UW.Init.Abbrevs

set_option linter.unusedVariables false

--------------------------------------------------------------------

def auxSum : ℕ → (ℕ → ℕ) → ℕ
  | 0, g => 0
  | 1, g => g 1
  | n+1, g => g (n+1) + auxSum n g

def sum (lo:ℕ) (hi:ℕ) (g:ℕ → ℕ) : ℕ :=
  auxSum (hi+1-lo) (fun i => g (i+lo-1))

syntax "Sum" ident ":=" term "to" term "," term : term

macro_rules
  | `( Sum $id:ident := $lo:term to $hi:term , $body:term ) =>
       `( sum $lo $hi (fun $id => $body))

--------------------------------------------------------------------
-- lemas

abbrev sumLo :=
  ∀ (lo hi : ℕ), ∀ (g : ℕ → ℕ), lo > hi →
    (Sum i := lo to hi, g i) = 0

abbrev sumBase :=
  ∀ (lo hi : ℕ), ∀ (g : ℕ → ℕ), lo = hi →
    (Sum i := lo to hi, g i) = g lo

abbrev sumInd  :=
  ∀ (lo hi : ℕ), ∀ (g : ℕ → ℕ), lo < hi →
    (Sum i := lo to hi, g i) = g hi + Sum i := lo to (hi-1), g i

--------------------------------------------------------------------
