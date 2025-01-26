----------------------------------------------------------------------
-- assumptions

declare_syntax_cat asmNum

syntax num            : asmNum
syntax asmNum "/" num : asmNum

syntax "asmNumToString" asmNum : term

macro_rules
  | `( asmNumToString $n:num ) => `( s!"{$n}" )
  | `( asmNumToString $a:asmNum / $n: num ) => `( s!"{asmNumToString $a}/{$n}")

----------------------------------------------------------------------

declare_syntax_cat asmId

syntax "Asm" asmNum : asmId

----------------------------------------------------------------------
declare_syntax_cat asm

syntax "Asm" asmNum ":" term : asm
syntax "Asm" asmNum ":" "Var" "(" ident+ ":" term ")" : asm
syntax "Asm" asmNum ":" "Var" "(" ident ":" term ")" ":=" term : asm

-----------------------------------------------------------------------
declare_syntax_cat target

syntax asmId  : target
syntax "Goal" : target
syntax term   : target  -- lemma name

-----------------------------------------------------------------------
-- sequent
-----------------------------------------------------------------------

declare_syntax_cat sequent

syntax asm+ : sequent
syntax asm* "⊢" term : sequent

-----------------------------------------------------------------------
-- proof rules
-----------------------------------------------------------------------

----------------------------------------------------------------------
-- elimination rules

declare_syntax_cat elimRuleName

syntax "AndElim"  : elimRuleName
syntax "OrElim"   : elimRuleName
syntax "OrElimLeft"   : elimRuleName
syntax "OrElimRight"   : elimRuleName
syntax "NotElim" : elimRuleName
syntax "ImplElim" : elimRuleName
syntax "ImplElimRev" : elimRuleName
syntax "IffElim" : elimRuleName
syntax "IffElimRev" : elimRuleName
syntax "ForallElim" : elimRuleName
syntax "ExistsElim" : elimRuleName
syntax "Elims"      : elimRuleName

----------------------------------------------------------------------
declare_syntax_cat usingItem

syntax asmId   : usingItem
syntax "Goal"  : usingItem
syntax term    : usingItem
syntax "Arith" : usingItem
syntax "Logic" : usingItem

----------------------------------------------------------------------
declare_syntax_cat usingClause

syntax "Using" usingItem,+ : usingClause

----------------------------------------------------------------------
declare_syntax_cat  elimRule

syntax elimRuleName target : elimRule

syntax elimRuleName target usingClause : elimRule

----------------------------------------------------------------------
-- assert
----------------------------------------------------------------------

declare_syntax_cat logicObjCat
syntax "Lemma "      : logicObjCat
syntax "Theorem "    : logicObjCat
syntax "Definition " : logicObjCat
syntax "Axiom "      : logicObjCat

-----------------------------------------------------------------------
declare_syntax_cat logicObj

--!!MDA: term is the name of the logic object
--!!MDA: would be nice to capture the name of the lemma
--!!MDA: look at ident syntax category
--!!MDA: look at .getId.toString
--!!MDA: syntax logicObjCat term : logicObj
syntax ident : logicObj

----------------------------------------------------------------------
-- contradiction
----------------------------------------------------------------------

declare_syntax_cat contradictJustification
syntax "Contradiction" asmId : contradictJustification
syntax "Contradiction" asmId "," asmId : contradictJustification

declare_syntax_cat simpleJustification
syntax logicObj  : simpleJustification
syntax "Logic"   : simpleJustification
syntax "Arith"   : simpleJustification
syntax asmId     : simpleJustification

-----------------------------------------------------------------------
declare_syntax_cat justification

syntax logicObj usingClause    : justification
syntax "Logic" "Using" asmId   : justification
syntax "Arith" "Using" asmId   : justification
syntax contradictJustification : justification
syntax elimRule                : justification
syntax simpleJustification,+   : justification

-----------------------------------------------------------------------
declare_syntax_cat assertTarget

syntax term : assertTarget
syntax asmId : assertTarget
syntax "Goal" : assertTarget

-----------------------------------------------------------------------
declare_syntax_cat assertRule
syntax "Assert " assertTarget : assertRule
syntax "Assert " assertTarget " By " justification : assertRule

----------------------------------------------------------------------
-- substitution
----------------------------------------------------------------------

declare_syntax_cat substName

syntax "Subst" : substName
syntax "SubstRev" : substName

----------------------------------------------------------------------
declare_syntax_cat substSrc

syntax asmId : substSrc
syntax logicObj : substSrc

----------------------------------------------------------------------
declare_syntax_cat substRule

syntax substName substSrc " Into " target,+ : substRule
syntax substName substSrc " Into " target usingClause : substRule
syntax substName term " Into " target " By " justification : substRule

----------------------------------------------------------------------
-- cases
----------------------------------------------------------------------
declare_syntax_cat caseRule

syntax "Cases " term:max,+ : caseRule

----------------------------------------------------------------------
-- induction
----------------------------------------------------------------------


/-
declare_syntax_cat inductType

syntax "Nat"   : inductType
syntax "List"  : inductType
syntax "Set"   : inductType
syntax "Graph" : inductType

----------------------------------------------------------------------
declare_syntax_cat inductRule

syntax "Induct " inductType : inductRule
syntax "InductStrong " inductType : inductRule
-/

declare_syntax_cat inductRule

syntax "InductNat " : inductRule
syntax "InductStrongNat " : inductRule
syntax "InductPos " : inductRule
syntax "InductStrongPos " : inductRule
syntax "InductList " : inductRule
syntax "InductStrongList " : inductRule
syntax "InductSet " : inductRule
syntax "InductStrongSet " : inductRule
syntax "InductStrongVertices " : inductRule
syntax "InductStrongEdges " : inductRule

----------------------------------------------------------------------
-- introduction rules
----------------------------------------------------------------------

declare_syntax_cat orIntroRuleName

syntax "OrIntroLeft" : orIntroRuleName
syntax "OrIntroRight" : orIntroRuleName

-----------------------------------------------------------------------
declare_syntax_cat introRule

syntax orIntroRuleName target usingClause : introRule
syntax "AndIntro" target "," target : introRule
syntax "OrIntro" asmId "," asmId : introRule

----------------------------------------------------------------------
-- top level proof rules
----------------------------------------------------------------------

declare_syntax_cat proofRule

syntax elimRule          : proofRule
syntax assertRule        : proofRule
syntax substRule         : proofRule
syntax caseRule          : proofRule
syntax inductRule        : proofRule
syntax introRule         : proofRule

----------------------------------------------------------------------
declare_syntax_cat proofTree
declare_syntax_cat subproofTree

syntax sequent " QED " justification,+ : proofTree
syntax sequent " By " proofRule proofTree : proofTree
syntax sequent " By " proofRule "{" subproofTree+ "}" : proofTree
-- syntax sequent " By " proofRule:max linebreak "{" subproofTree+ "}" : proofTree
syntax sequent " By " proofRule ";" "{" subproofTree+ "}" : proofTree

syntax "Subproof " asmNum ":" term proofTree : subproofTree

syntax "Proof " proofTree : term
