import UW
import UW.Init.Lemmas  -- lemmas are in Lean/UW/Init/Lemmas.lean

Def fib : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | n+1 => fib (n-1) + fib n

Eval fib 0
Eval fib 1
Eval List.map fib [0,1,2,3,4,5,6,7,8,]

Theorem fibThm :=
  ∀ (n:ℕ), (Sum i := 0 to n, fib i)  =  fib (n+2) - 1
Proof
