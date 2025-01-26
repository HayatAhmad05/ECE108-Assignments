import UW.Init.ExistsOne
import UW.Init.List
import UW.Init.Graph

open Graph

set_option linter.unusedVariables false

----------------------------------------------------------------------
-- **define predicates and functions for trees**
----------------------------------------------------------------------

abbrev existsOnePath (v1 v2 : Vertex) (g : Graph) : Prop :=
  ∃! (p : List Vertex),
    isPath p g ∧
    v1 = startPt p ∧
    v2 = endPt p

abbrev isTree (g : Graph) : Prop :=
  isGraph g  ∧
  ∃! ( r : Vertex),  r ∈ vertices g  ∧
    ∀ (v : Vertex), v ∈ vertices g →
      existsOnePath r v g

abbrev isBTree (g : Graph) : Prop :=
  isTree g  ∧
  ∀ (v : Vertex), v ∈ vertices g → size (next v g) ≤ 2

----------------------------------------------------------------------
abbrev isLeaf (v : Vertex) (g : Graph) : Prop :=
  v ∈ vertices g ∧ next v g = ∅

abbrev isUW (r : Vertex) (g : Graph) : Prop :=
  r ∈ vertices g ∧
  ∀ (v : Vertex), v ∈ vertices g →
      ∃! (p:List Vertex),
        isPath p g ∧
        r = startPt p ∧
        v = endPt p

abbrev leaves (g : Graph) : Set Vertex :=
  { v | v ∈ vertices g, isLeaf v g}

----------------------------------------------------------------------
-- The descendents of a vertex
-- The children, the children's children, etc
-- Any vertex that is reachable from v.

abbrev descV (v : Vertex) (g : Graph) :=
  { v1 ∈ vertices g, existsPath v v1 g}

abbrev descE (v : Vertex) (g : Graph) :=
  { e ∈ edges g, existsPath v e.1 g}

abbrev desc (v : Vertex) (g : Graph) :=
  Graph.graph (descV v g) (descE v g)

----------------------------------------------------------------------

instance (g : Graph) (v : Vertex): Decidable (isLeaf v g) := sorry
