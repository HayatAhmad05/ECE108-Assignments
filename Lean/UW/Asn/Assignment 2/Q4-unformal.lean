import UW

-----------------------------------------------------------------------
-- *Q4: From logic to English*
--
-- Translate the proposition below into English
-- For full marks, your sentence must have the same structure as
-- the proposition and use the English words that are make the sentence
-- as easy to understand as possible.

Var (user sup alarm mem shutdown : Prop)

-- user     := the user process is running
-- sup      := the supervisor process is running
-- alarm    := the system activates the alarm
-- mem      := memory is full
-- shutdown := the system shall shutdown

Def Q4 := user ∧ (alarm → mem) → ¬ sup ∨ shutdown

-- If the user process is running and activating the alarm implies that the memory
-- is full, then either the supervisor process is not running or the system will
-- shutdown
