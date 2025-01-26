set_option linter.unusedVariables false


inductive Pos : Type where
  | one : Pos
  | succ : Pos → Pos

----------------------------------------------------------------------
instance : OfNat Pos (n + 1) where
  ofNat :=
    let rec natPlusOne : Nat → Pos
      | 0 => Pos.one
      | k + 1 => Pos.succ (natPlusOne k)
    natPlusOne n

----------------------------------------------------------------------

@[match_pattern]
def Pos.plus : Pos → Pos → Pos
  | Pos.one, k => Pos.succ k
  | Pos.succ n, k => Pos.succ (n.plus k)

instance : Add Pos where
  add := Pos.plus

----------------------------------------------------------------------

def Pos.toNat : Pos → Nat
  | Pos.one => 1
  | Pos.succ n => n.toNat + 1

instance : Coe Pos Nat where
  coe x := x.toNat

----------------------------------------------------------------------
def Pos.fromNat : Nat → Pos
  | 0 => Pos.one
  | Nat.succ n => Pos.succ (Pos.fromNat n)

----------------------------------------------------------------------
instance : HPow Pos Nat Pos where
  hPow :=
    fun (p:Pos) (n:Nat) => Pos.fromNat (Nat.pow (Pos.toNat p) n )


----------------------------------------------------------------------
instance : LT Pos where
  lt := fun (p1 p2 : Pos) => Nat.lt (Pos.toNat p1) (Pos.toNat p2)

instance (x y : Pos) : Decidable (x < y) := sorry

----------------------------------------------------------------------
instance : LE Pos where
  le := fun (p1 p2 : Pos) => Nat.le (Pos.toNat p1) (Pos.toNat p2)

----------------------------------------------------------------------
--!!MDA: look at def of Nat.sub

def Pos.sub : Pos → Pos → Pos
  | Pos.one   , k       => Pos.one --!!MDA: should raise an error, but how?
  | Pos.succ n, Pos.one => n
  | Pos.succ n, Pos.succ k => Pos.succ (n.sub k)

instance : Sub Pos where
  sub := Pos.sub

def Pos.sub_np (n:Nat) (p:Pos) : Nat := n - p.toNat

def Pos.sub_pn (p:Pos) (n:Nat) : Nat := p.toNat - n

instance : HSub Pos Nat Nat where
  hSub := Pos.sub_pn

instance : HSub Nat Pos Nat where
  hSub := Pos.sub_np

----------------------------------------------------------------------

def Pos.mul : Pos → Pos → Pos
  | Pos.one, k => k
  | Pos.succ n, k => n.mul k + k

instance : Mul Pos where
  mul := Pos.mul

----------------------------------------------------------------------

def Pos.pow : Pos → Pos → Pos
  | n, Pos.one    => n
  | n, Pos.succ k => n * (Pos.pow n k)

instance : Pow Pos Pos where
  pow := Pos.pow

def Pos.pow_nat : Nat → Pos → Nat
  | n, Pos.one    => n
  | n, Pos.succ k => n * (Pos.pow_nat n k)

instance : Pow Nat Pos where
  pow := Pos.pow_nat

----------------------------------------------------------------------
----------------------------------------------------------------------
instance : ToString Pos where
  toString x := toString (x.toNat)


----------------------------------------------------------------------

macro "ℕ+" : term => `( Pos )

/-
this works
abbrev n : ℕ+ := 3
abbrev m : ℕ+ := 4

#eval n + m
-/
