import UW.Init.Set
import UW.Init.Graph
import UW.Init.Tree

variable {Ty : Type}

--------------------------------------------------------------------------------
-- if-then-else lemmas
--------------------------------------------------------------------------------
abbrev iteTrue  := ∀ (b : Bool) (e1 e2 : Ty), b  → ( (if b then e1 else e2) = e1 )
abbrev iteFalse := ∀ (b : Bool) (e1 e2 : Ty), ¬b → ( (if b then e1 else e2) = e2 )
--------------------------------------------------------------------------------
-- set lemmas: intersection, union, size
--------------------------------------------------------------------------------
-- empty set

abbrev memEmpty                   := ∀ (x : Ty), ¬(x ∈ ∅)

-- intersection

abbrev memInter    [BEq Ty] := ∀ (x : Ty) (s1 s2 : Set Ty), x ∈ (s1 ∩ s2)  ↔  x ∈ s1  ∧  x ∈ s2
abbrev interEmpty  [BEq Ty] := ∀ (s : Set Ty), ∅ ∩ s = ∅
abbrev interAssoc  [BEq Ty] := ∀ (s1 s2 s3 : Set Ty), (s1 ∩ s2) ∩ s3 = s1 ∩ (s2 ∩ s3)
abbrev interMem    [BEq Ty] := ∀ (x : Ty) (s : Set Ty), x ∈ s → ({x} ∩ s) = {x}
abbrev interNotMem [BEq Ty] := ∀ (x : Ty) (s : Set Ty), ¬(x ∈ s) → ({x} ∩ s) = ∅

-- union

abbrev memUnion   [BEq Ty] := ∀ (x : Ty) (s1 s2 : Set Ty), x ∈ (s1 ∪ s2) ↔ x ∈ s1 ∨ x ∈ s2
abbrev unionEmpty [BEq Ty] := ∀ (s : Set Ty), ∅ ∪ s = s
abbrev unionAssoc [BEq Ty] := ∀ (s1 s2 s3 : Set Ty), (s1 ∪ s2) ∪ s3 = s1 ∪ (s2 ∪ s3)
abbrev unionMem   [BEq Ty] := ∀ (x : Ty) (s : Set Ty), x ∈ s → ({x} ∪ s) = s

-- intersection and union

abbrev interUnionDistrib [BEq Ty] :=
  ∀ (s1 s2 s3 : Set Ty), s1 ∩ (s2 ∪ s3) = (s1 ∩ s2) ∪ (s1 ∩ s3)
abbrev interMemUnion [BEq Ty]     :=
  ∀ (x : Ty) (s1 s2 : Set Ty), x ∈ s2    → ({x} ∪ s1) ∩ s2 = {x} ∪ (s1 ∩ s2)

abbrev interNotMemUnion [BEq Ty]  :=
  ∀ (x : Ty) (s1 s2 : Set Ty), ¬(x ∈ s2) → ({x} ∪ s1) ∩ s2 = s1 ∩ s2

abbrev unionMemUnion [BEq Ty]     :=
  ∀ (x : Ty) (s1 s2 : Set Ty), x ∈ s2    → ({x} ∪ s1) ∪ s2 = s1 ∪ s2

-- size
abbrev sizeEmpty [BEq Ty]         := size (∅ : Set Ty) = 0

abbrev sizeGt0ImpExistsMem [DecidableEq α] :=
  ∀ (s : Set α), size s > 0 → ∃ (x:α), x ∈ s

-- size and union

abbrev sizeUnionNotMem [BEq Ty]   := ∀ (x : Ty) (s : Set Ty), ¬(x ∈ s) → size ({x} ∪ s) = 1 + size s

abbrev sizeUnionMem [BEq Ty]      := ∀ (x : Ty) (s : Set Ty), x ∈ s → size ({x} ∪ s) = size  s

--------------------------------------------------------------------------------
-- subset
--------------------------------------------------------------------------------

abbrev subseteqIff [BEq Ty]       :=
  ∀ (s1 s2 : Set Ty), s1 ⊆ s2  ↔  ∀ (x : Ty), x ∈ s1  →  x ∈ s2

abbrev subsetIff [BEq Ty]         :=
  ∀ (s1 s2 : Set Ty), s1 ⊂ s2  ↔  s1 ⊆ s2 ∧ ∃ (x : Ty), x ∈ s2  ∧  ¬(x ∈ s1)

--------------------------------------------------------------------------------
-- summation over sets
--------------------------------------------------------------------------------

abbrev sumEmpty :=
  ∀ (g : Ty → ℕ),
    (Sum c ∈ ∅, g c) = 0

abbrev sumOne :=
  ∀ (x1 : Ty),
    ∀ (g : Ty → ℕ),
      (Sum x ∈ {x1}, g x) = g x1

abbrev sumTwo :=
  ∀ (x1 x2 : Ty), x1 ≠ x2 →
    ∀ (g : Ty → ℕ),
      (Sum x ∈ {x1,x2}, g x) = g x1 + g x2

abbrev sumInduct :=
  ∀ (x : Ty), ∀ (s : Set Ty), ∀ (h : Ty → ℕ),
    ¬(x ∈ s) →
      (Sum x1 ∈ ({x} ∪ s), h x1) = h x + (Sum x1 ∈ s, h x1)

abbrev impSumEq :=
  ∀ (s : Set Ty),
    ∀ (h1 h2 : Ty → ℕ),
      ∀ (const : ℕ),
        (∀ (x : Ty), x ∈ s → (h1 x + const = h2 x)) →
          ((Sum x ∈ s, h1 x) + size s * const = Sum x ∈ s, h2 x)

--------------------------------------------------------------------------------
-- lists
--------------------------------------------------------------------------------

open List

abbrev listSize0 :=
  ∀ (xs : List Ty), size xs = 0 ↔ xs = []

abbrev listMemEmpty :=
  ∀ (x : Ty), ¬(mem x [])

abbrev listCases :=
  ∀ (xs : List Ty),
    xs = []  ∨  ∃ (y : Ty) (ys : List Ty), xs = y :: ys

abbrev memSplice :=
  ∀ (z : Ty) (xs ys : List Ty), mem z (splice xs ys)  ↔  mem z xs  ∨  mem z ys

abbrev spliceSize :=
  ∀ (xs ys : List Ty), size (splice xs ys)  =  size xs + size ys

--------------------------------------------------------------------------------
-- graphs: types of graphs
--------------------------------------------------------------------------------
open Graph

--------------------------------------------------------------------------------
-- equality of graphs
--------------------------------------------------------------------------------

abbrev eqGraph :=
  ∀ (g1 g2 : Graph),
    g1 = g2  ↔  (vertices g1 = vertices g2)  ∧  (edges g1 = edges g2)

--------------------------------------------------------------------------------
-- empty graph
--------------------------------------------------------------------------------

abbrev emptyNoVertices := vertices emptyGraph = ∅

abbrev emptyNoEdges    := edges emptyGraph = ∅

abbrev emptyNotTree    := ¬(isTree emptyGraph)

--------------------------------------------------------------------------------
-- **Trees**
--------------------------------------------------------------------------------

abbrev treeIsGraph := ∀ (g : Graph), isTree g → isGraph g

abbrev bTreeIsTree := ∀ (g : Graph), isBTree g → isTree g

--------------------------------------------------------------------------------
-- root
--------------------------------------------------------------------------------

abbrev treeHasUW :=
  ∀ (g : Graph), isTree g →
    ∃ (r : Vertex), isUW r g

abbrev rootInVertices :=
  ∀ (g : Graph), isTree g →
    ∀ (r : Vertex), isUW r g → r ∈ vertices g

--------------------------------------------------------------------------------
-- leaves
--------------------------------------------------------------------------------

abbrev leavesLeaf :=
  ∀ (g : Graph), isTree g →
    ∀ (v : Vertex), v ∈ vertices g →
      isLeaf v g ↔
      size (leaves (desc v g)) = 1

abbrev nextEmptyIffLeaf :=
  ∀ (g : Graph), isTree g →
    ∀ (v : Vertex), v ∈ vertices g →
      isLeaf v g ↔
      next v g = ∅

--------------------------------------------------------------------------------
-- graphs: next (children in trees)
--------------------------------------------------------------------------------

abbrev nextIffEdge :=
  ∀ (g : Graph), isGraph g →
    ∀ (v1 v2 : Vertex), v1 ∈ vertices g →
      v2 ∈ next v1 g ↔ (v1,v2) ∈ edges g

abbrev nextInVertices :=
  ∀ (g : Graph), isGraph g →
      ∀ (v1 v2: Vertex),
        v1 ∈ vertices g →
        v2 ∈ next v1 g →
        v2 ∈ vertices g

--------------------------------------------------------------------------------
-- graphs: descendants
--------------------------------------------------------------------------------

abbrev descIsTree :=
  ∀ (g : Graph), isTree g →
    ∀ (v : Vertex), v ∈ vertices g →
      isTree (desc v g)

abbrev descNumLeaves :=
  ∀ (g : Graph), isTree g →
    ∀ (v : Vertex), v ∈ vertices g →
      ¬(isLeaf v g) →
        size (leaves (desc v g)) = Sum c ∈ next v g, size (leaves (desc c g))

abbrev descNumVertices :=
  ∀ (g : Graph), isTree g →
    ∀ (v : Vertex), v ∈ vertices g →
        size (vertices (desc v g)) = (Sum c ∈ next v g, size (vertices (desc c g))) + 1

abbrev descNumEdges :=
  ∀ (g : Graph), isTree g →
    ∀ (v : Vertex), v ∈ vertices g →
        size (edges (desc v g)) = (Sum c ∈ next v g, size (edges (desc c g))) + size (next v g)

abbrev descUWEqTree :=
  ∀ (g : Graph), isTree g →
    ∀ (r : Vertex), isUW r g →
      desc r g = g

abbrev descNextIsSubgraphV :=
  ∀ (g : Graph), isTree g →
    ∀ (v c : Vertex), v ∈ vertices g →
      c ∈ next v g →
      subgraphV (desc c g) g

abbrev descNextIsSubgraphE :=
  ∀ (g : Graph), isTree g →
    ∀ (v c : Vertex), v ∈ vertices g →
      c ∈ next v g →
      subgraphE (desc c g) g

--------------------------------------------------------------------------------
-- case splitting on binary trees
--------------------------------------------------------------------------------

abbrev bTreeNextCases :=
  ∀ (g : Graph), isBTree g →
    ∀ (v : Vertex), v ∈ vertices g →
      isLeaf v g ∧ next v g = ∅ ∨
      ¬(isLeaf v g) ∧ (∃ (v1    : Vertex), next v g = {v1})  ∨
      ¬(isLeaf v g) ∧ (∃ (v1 v2 : Vertex), v1 ≠ v2 ∧ next v g = {v1,v2})
