import UW

Var ( replace_this_variable_with_your_answer  : Prop )

-----------------------------------------------------------------------
-- *Q3: Formalization*
--
-- Formalize each of the sentences below

-- *Q3a:* "If the supply voltage exceeds 5V for more than 30 seconds
--        while the system is runnning, then the system shall shutdown."

Def Q3a := ((V > 5) ∧ (t >30) ∧ R) → S

-- *Q3b:* "When the system is in supervisor mode, it shall throw an
--        exception only if a segmentation fault occurs and the user
--        process is not pending.

Def Q3b := S → (E ↔ (F ∧ ¬ U))

-- *Q3c:* "If main() calls foo() implies that the variable i is a
--        prime number, then the variable j must be odd or k is even."


Def Q3c := (C → P(i)) → (O(j) ∨ E(k))

-- *Q3d:* "If main() calls foo() implies that the variable i is a
--        prime number, then the variable j must be odd when k is even."

Def Q3d := (C → P(i)) → (E(k) → O(j))

-- *Q3e:* "The system being in user mode while no exceptions are being
--        processed is sufficient for the user process to have 100%
--        of the CPU cycles."

Def Q3e := (U ∧ ¬E) → C
