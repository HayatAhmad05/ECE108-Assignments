import UW.Init.Syntax

set_option linter.unusedVariables false
----------------------------------------------------------------------
-- intro
----------------------------------------------------------------------

--!!MDA: semicolonOrLinebreak

def nl : String := "
"
-----------------------------------------------------------------------
syntax "termToString" term : term

macro_rules
  | `( termToString $t:term ) => `( "??" )


-----------------------------------------------------------------------
syntax "termListToString " term,* : term

macro_rules
  | `( termListToString $t:term ) => `( termToString $t)
  | `( termListToString $t:term, $ts:term,*  ) =>
      `( (termToString $t) ++", "++ (termListToString $ts,*) )

----------------------------------------------------------------------
syntax "asmIdToString" asmId : term
macro_rules
  | `( asmIdToString Asm $a:asmNum ) => `( s!"Asm {asmNumToString $a}")

syntax "asmIdsToString" asmId,+ : term
macro_rules
  | `( asmIdsToString $a:asmId ) => `( asmIdToString $a )
  | `( asmIdsToString $a:asmId, $as:asmId,* ) =>
        `( asmIdToString $a ++", "++ asmIdsToString $as,* )

----------------------------------------------------------------------
syntax "asmToTerm" asm "asmToTermXX" term : term

macro_rules
  | `( asmToTerm Asm $a:asmNum : $asmBody:term asmToTermXX $other:term ) => `( $asmBody → $other )
  | `( asmToTerm Asm $a:asmNum : Var ($vs:ident* : $ty:term) asmToTermXX $other:term ) => `( ∀ $vs* : $ty, $other )
  | `( asmToTerm Asm $a:asmNum : Var ($v:ident : $ty:term) := $val:term asmToTermXX $other:term ) =>
      `( ∀ $v : $ty, $v=$val → $other )

/-
syntax "asmToTerm" asm : term

macro_rules
  | `( asmToTerm Asm $a:asmNum : $t:term ) => `( $t )
-/

-----------------------------------------------------------------------

syntax "asmsToTerm" asm* "asmToTermXX" term : term

macro_rules
  | `( asmsToTerm asmToTermXX $t:term ) => `( $t )
  | `( asmsToTerm $asm asmToTermXX $t:term ) => `( asmToTerm $asm asmToTermXX $t)
  | `( asmsToTerm $asm:asm $asms:asm* asmToTermXX $t:term) => `( asmToTerm $asm asmToTermXX asmsToTerm $asms* asmToTermXX $t)

----------------------------------------------------------------------
syntax "sequentToTerm" sequent "asmToTermXX" term : term

macro_rules
  | `( sequentToTerm $asms:asm* asmToTermXX $other:term ) => `( asmsToTerm $asms* asmToTermXX $other)
  | `( sequentToTerm ⊢ $goal:term asmToTermXX $other:term) => `( $goal → $other )
  | `( sequentToTerm $asms:asm* ⊢ $goal asmToTermXX $other:term ) => `( asmsToTerm $asms* asmToTermXX ($goal → $other))


----------------------------------------------------------------------
syntax "elimRuleNameToString" elimRuleName : term

macro_rules
  | `( elimRuleNameToString AndElim     ) => `( "AndElim " )
  | `( elimRuleNameToString OrElim      ) => `( "OrElim " )
  | `( elimRuleNameToString OrElimLeft  ) => `( "OrElimLeft " )
  | `( elimRuleNameToString OrElimRight ) => `( "OrElimRight " )
  | `( elimRuleNameToString NotElim     ) => `( "NotElim " )
  | `( elimRuleNameToString ImplElim    ) => `( "ImplElim " )
  | `( elimRuleNameToString ImplElimRev ) => `( "ImplElimRev " )
  | `( elimRuleNameToString IffElim     ) => `( "IffElim " )
  | `( elimRuleNameToString IffElimRev  ) => `( "IffElimRev " )
  | `( elimRuleNameToString ForallElim  ) => `( "ForallElim " )
  | `( elimRuleNameToString ExistsElim  ) => `( "ExistsElim " )
  | `( elimRuleNameToString Elims       ) => `( "Elims " )

----------------------------------------------------------------------
syntax "targetToString" target : term

macro_rules
  | `( targetToString $a:asmId ) => `( asmIdToString $a )
  | `( targetToString Goal     ) => `( "Goal")
  | `( targetToString $t:term  ) => `( termToString $t )

----------------------------------------------------------------------
syntax "targetListToString" target,+ : term

macro_rules
  | `( targetListToString $t:target ) => `( targetToString $t )
  | `( targetListToString $t:target, $ts:target,* ) =>
        `( targetToString $t ++", "++ targetListToString $ts,*)

----------------------------------------------------------------------
syntax "usingItemToString" usingItem : term

macro_rules
  | `( usingItemToString $a:asmId ) => `( asmIdToString $a)
  | `( usingItemToString $t:term  ) => `( termToString $t )
  | `( usingItemToString Logic    ) => `( "Logic" )
  | `( usingItemToString Arith    ) => `( "Arith" )
  | `( usingItemToString Goal     ) => `( "Goal" )

----------------------------------------------------------------------
syntax "usingClausesToStringAux" usingItem,+ : term

--!!MDA: syntax "usingClausesToString" "Using" usingItem,+ : term
syntax "usingClausesToString" usingClause : term

macro_rules
  | `( usingClausesToStringAux $u:usingItem ) => `( usingItemToString $u )
  | `( usingClausesToStringAux $u:usingItem, $us:usingItem,*) =>
       `( usingItemToString $u ++ usingClausesToStringAux $us,*)

macro_rules
  | `( usingClausesToString Using $u:usingItem ) => `( " Using " ++ usingItemToString $u)
  | `( usingClausesToString Using $u:usingItem, $us:usingItem,*) =>
       `( " Using " ++ usingItemToString $u ++", "++ usingClausesToStringAux $us,*)

----------------------------------------------------------------------
syntax "elimRuleToString" elimRule : term

macro_rules
  | `( elimRuleToString $n:elimRuleName $tgt:target) => `( elimRuleNameToString $n ++ targetToString $tgt)
  | `( elimRuleToString $n:elimRuleName $tgt:target Using $u:usingItem) =>
       `( elimRuleNameToString $n ++ targetToString $tgt ++ usingClausesToString Using $u)
  | `( elimRuleToString $n:elimRuleName $tgt:target Using $us:usingItem,*) =>
       `( elimRuleNameToString $n ++ targetToString $tgt ++ usingClausesToString Using $us,*)

----------------------------------------------------------------------
syntax "logicObjCatToString" logicObjCat : term

macro_rules
  | `( logicObjCatToString Lemma ) => `( "Lemma ")
  | `( logicObjCatToString Theorem ) => `( "Theorem ")
  | `( logicObjCatToString Definition ) => `( "Definition ")
  | `( logicObjCatToString Axiom ) => `( "Axiom ")

----------------------------------------------------------------------
syntax "logicObjToString" logicObj : term

/-
macro_rules
  | `( logicObjToString $l:logicObjCat $t:term ) => `( logicObjCatToString $l ++ termToString $t)
-/

macro_rules
  | `( logicObjToString ident ) => `( "ident" )

----------------------------------------------------------------------
syntax "contradictJustificationToString" contradictJustification : term

macro_rules
  | `( contradictJustificationToString Contradiction $a:asmId ) =>
      `( "Contradiction " ++ asmIdToString $a)
  | `( contradictJustificationToString Contradiction $a1:asmId, $a2:asmId) =>
      `( "Contradiction " ++ asmIdToString $a1 ++", "++ asmIdToString $a2)

----------------------------------------------------------------------
syntax "simpleJustificationToString" simpleJustification : term

macro_rules
  | `( simpleJustificationToString $l:logicObj ) => `( logicObjToString $l )
  | `( simpleJustificationToString Logic )   => `( "Logic" )
  | `( simpleJustificationToString Arith )   => `( "Arith" )
  | `( simpleJustificationToString $a:asmId) => `( asmIdToString $a )

syntax "simpleJustificationsToString" simpleJustification,+ : term

macro_rules
  | `( simpleJustificationsToString $j:simpleJustification) =>
        `( simpleJustificationToString $j )
  | `( simpleJustificationsToString $j:simpleJustification, $js:simpleJustification,* ) =>
        `( simpleJustificationToString $j ++", "++ simpleJustificationsToString $js,* )

----------------------------------------------------------------------
syntax "justificationToString" justification : term

macro_rules
  | `( justificationToString $l:logicObj $u:usingClause ) =>
        `( logicObjToString $l ++ usingClausesToString $u)
  | `( justificationToString Logic Using $a:asmId)   => `( "Logic Using" ++ asmIdToString $a)
  | `( justificationToString Arith Using $a:asmId)   => `( "Arith Using" ++ asmIdToString $a)
  | `( justificationToString $c:contradictJustification ) =>
        `(    contradictJustificationToString $c )
  | `( justificationToString $r:elimRule ) =>
        `(    elimRuleToString $r )
  | `( justificationToString $js:simpleJustification,*) =>
        `( simpleJustificationsToString $js,*)

----------------------------------------------------------------------
syntax "assertTargetToString" assertTarget : term

macro_rules
  | `( assertTargetToString $t:term ) => `( termToString $t )
  | `( assertTargetToString $a:asmId ) => `( asmIdToString $a )


----------------------------------------------------------------------
syntax "assertRuleToString" assertRule : term

macro_rules
  | `( assertRuleToString Assert $a:assertTarget ) =>
       `( "Assert "++ assertTargetToString $a )
  | `( assertRuleToString Assert $a:assertTarget By $j:justification ) =>
       `( "Assert "++ assertTargetToString $a ++
          " By " ++ justificationToString $j )



----------------------------------------------------------------------
syntax "substNameToString" substName : term

macro_rules
  | `( substNameToString Subst ) => `( "Subst" )
  | `( substNameToString SubstRev ) => `( "SubstRev" )

----------------------------------------------------------------------
syntax "substSrcToString" substSrc : term

macro_rules
  | `( substSrcToString $a:asmId ) => `( asmIdToString $a)
  | `( substSrcToString $l:logicObj ) => `( logicObjToString $l)


----------------------------------------------------------------------
syntax "substRuleToString" substRule : term

macro_rules
  | `( substRuleToString $sn:substName $ss:substSrc Into $ts:target,*) =>
      `( substNameToString $sn ++" "++ substSrcToString $ss ++" Into "++ targetListToString $ts,*)
  | `( substRuleToString $sn:substName $ss:substSrc Into $t:target $u:usingClause) =>
      `( substNameToString $sn ++" "++ substSrcToString $ss ++
         " Into "++ targetToString $t ++
         usingClausesToString $u
         )
  | `( substRuleToString $sn:substName $tm:term Into $tg:target By $j:justification) =>
      `( substNameToString $sn ++" "++
         termToString $tm ++
         " By "++ justificationToString $j )




----------------------------------------------------------------------

syntax "caseRuleToString " caseRule : term

macro_rules
  | `( caseRuleToString Cases $t:term ) => `( "Cases " ++ termToString $t)
  | `( caseRuleToString Cases $t:term, $ts:term,* ) =>
      `( "Cases " ++ (termToString $t) ++", "++ termListToString $ts,*)

----------------------------------------------------------------------
/-syntax "inductTypeToString" inductType : term

macro_rules
  | `( inductTypeToString Nat )   => `( "Nat" )
  | `( inductTypeToString List )  => `( "List" )
  | `( inductTypeToString Set )   => `( "Set" )
  | `( inductTypeToString Graph ) => `( "Graph" )
-/

----------------------------------------------------------------------
syntax "inductRuleToString" inductRule : term

macro_rules
  | `( inductRuleToString InductNat ) => `( "InductNat ")
  | `( inductRuleToString InductStrongNat ) => `( "InductStrongNat ")
  | `( inductRuleToString InductList ) => `( "InductList ")
  | `( inductRuleToString InductStrongList ) => `( "InductStrongList ")
  | `( inductRuleToString InductSet ) => `( "InductSet ")
  | `( inductRuleToString InductStrongSet ) => `( "InductStrongSet ")
  | `( inductRuleToString InductStrongVertices ) => `( "InductStrongVertices` ")
  | `( inductRuleToString InductStrongEdges ) => `( "InductStrongEdges ")

----------------------------------------------------------------------
syntax "orIntroRuleNameToString " orIntroRuleName : term

macro_rules
  | `( orIntroRuleNameToString OrIntroLeft ) => `( "OrIntroLeft" )
  | `( orIntroRuleNameToString OrIntroRight ) => `( "OrIntroRight" )

----------------------------------------------------------------------
syntax "introRuleToString " introRule : term

macro_rules
  | `( introRuleToString $n:orIntroRuleName $t:target $u:usingClause ) =>
        `( orIntroRuleNameToString $n ++ targetToString $t ++ usingClausesToString $u)
  | `( introRuleToString AndIntro $t1:target, $t2:target ) =>
        `( "AndIntro " ++ targetToString $t1 ++ targetToString $t2)
  | `( introRuleToString OrIntro $a1:asmId, $a2:asmId ) =>
        `( "OrIntro " ++ asmIdToString $a1 ++ asmIdToString $a2)

----------------------------------------------------------------------
syntax "proofRuleToString" proofRule : term

macro_rules
  | `( proofRuleToString $r:elimRule       ) => `( elimRuleToString $r )
  | `( proofRuleToString $r:assertRule     ) => `( assertRuleToString $r )
  | `( proofRuleToString $r:substRule      ) => `( substRuleToString $r )
  | `( proofRuleToString $r:caseRule       ) => `( caseRuleToString $r )
  | `( proofRuleToString $r:inductRule     ) => `( inductRuleToString $r )
  | `( proofRuleToString $r:introRule      ) => `( introRuleToString $r )

----------------------------------------------------------------------
syntax "subproofTreeToTerm" subproofTree : term

syntax "subproofTreesToTerm" subproofTree+ : term

macro_rules
  | `( subproofTreeToTerm Subproof $a:asmNum : $descr:term $p:proofTree ) =>
      `( Proof $p )

macro_rules
  | `( subproofTreesToTerm $p:subproofTree ) =>
      `( subproofTreeToTerm $p )
  | `( subproofTreesToTerm $p:subproofTree $ps:subproofTree* ) =>
      `( subproofTreeToTerm $p ∧ subproofTreesToTerm $ps* )

macro_rules
  -------------------------------------------------------------
  | `( Proof $s:sequent QED $j:justification ) =>
      `( sequentToTerm $s asmToTermXX true)
  -------------------------------------------------------------
  | `( Proof $s:sequent By $r:proofRule $p:proofTree) =>
      `( sequentToTerm $s asmToTermXX (Proof $p) )
  -------------------------------------------------------------
  | `( Proof $s:sequent By $r:proofRule { $p:subproofTree } ) =>
      `( sequentToTerm $s asmToTermXX (subproofTreeToTerm $p) )
  -------------------------------------------------------------
  | `( Proof $s:sequent By $r:proofRule { $p:subproofTree $ps:subproofTree* } ) =>
      `( sequentToTerm $s asmToTermXX ( (subproofTreeToTerm $p) ∧ (subproofTreesToTerm $ps*) ) )
  -------------------------------------------------------------
  | `( Proof $s:sequent By $r:proofRule ; { $p:subproofTree } ) =>
      `( sequentToTerm $s asmToTermXX (subproofTreeToTerm $p) )
  -------------------------------------------------------------
   | `( Proof $s:sequent By $r:proofRule ; { $p:subproofTree $ps:subproofTree* } ) =>
      `( sequentToTerm $s asmToTermXX ( (subproofTreeToTerm $p) ∧ (subproofTreesToTerm $ps*) ) )

----------------------------------------------------------------------
 -- | `( Proof $s:sequent By $r:proofRule
  --      { $p:subproofTree } ) =>
  --     `( sequentToTerm $s asmToTermXX (subproofTreeToTerm $p) )
  -------------------------------------------------------------
