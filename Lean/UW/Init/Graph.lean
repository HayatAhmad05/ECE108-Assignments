import UW.Init.Abbrevs
import UW.Init.List
import UW.Init.Set

open Set
set_option linter.unusedVariables false

namespace Graph

variable {α β : Type}
--------------------------------------------------------------------------------
-- *vertices and edges*
--------------------------------------------------------------------------------
/-
 * A `Graph` is a set of vertices and a set of edges.
 * An edge is a pair of vertices.
 * We use natural numbers (Nat) to identify the vertices
 *
 * This is a model for **directed** graph, because the order
 * of the vertices in an edge matters:  (1,2) ≠ (2,1).
 *
 * With an **undirected** graph, the order of the vertices in an edge
 * does not matter: (1,2) = (2,1).
 *
 -/

abbrev Vertex   : Type := ℕ
abbrev Edge     : Type := (Vertex × Vertex)

abbrev Vertices : Type := Set Vertex
abbrev Edges    : Type := Set Edge

--------------------------------------------------------------------------------
-- *graph type*
--------------------------------------------------------------------------------

inductive Graph where
  | graph : (Set ℕ) → (Set (ℕ × ℕ)) → Graph

open Graph

-- *accessor functions*

abbrev edges    : (g:Graph) → Edges
  | graph vertices edges => edges

abbrev vertices : (g:Graph) → Vertices
  | graph vertices edges => vertices

--------------------------------------------------------------------------------
-- *predicate to define a legal graph*
--------------------------------------------------------------------------------
/-
 * The `graph` type just says that we have a set of vertices and a set of edges.
 * It does not place any constraints on the edges.  To be a legal graph, the vertices
 * in the edges must be in the set of vertices.  We capture this constraint in the
 * isGraph predicate.
 -/

abbrev isGraph (g:Graph) :=
  ∀ (v1 v2 : Vertex), (v1,v2) ∈ edges g → v1 ∈ vertices g ∧ v2 ∈ vertices g

--------------------------------------------------------------------------------
abbrev emptyGraph := graph empty empty

--------------------------------------------------------------------------------
abbrev subgraphV (g1 g2 : Graph) : Prop :=
  isGraph g1 ∧
  vertices g1 ⊂ vertices g2 ∧
  edges g1 ⊆ edges g2

abbrev subgraphE (g1 g2 : Graph) : Prop :=
  isGraph g1 ∧
  vertices g1 ⊆ vertices g2 ∧
  edges g1 ⊂ edges g2

--------------------------------------------------------------------------------
-- **next and prev vertices**
--------------------------------------------------------------------------------

abbrev next (v1 : Vertex) (g : Graph) : Set Vertex :=
  { v2 ∈ vertices g, (v1,v2) ∈ edges g }

--------------------------------------------------------------------------------
-- **paths**
-- a path is a list of vertices
--------------------------------------------------------------------------------

abbrev isPath : (p : List Vertex) → (g : Graph) → Prop
  | []        , g => true
  | [v]       , g => v ∈ vertices g
  | v1::v2::vs, g => (v1,v2) ∈ edges g  ∧  isPath (v2::vs) g

abbrev startPt (p : List Vertex) : Vertex := List.front p

abbrev endPt   (p : List Vertex) : Vertex := List.back p

abbrev isPathFromTo (v1 v2 : Vertex) (p : List Vertex) (g : Graph) : Prop :=
  isPath p g ∧
  v1 = startPt p ∧
  v2 = endPt p

abbrev noDups [BEq Ty]: (xs : List Ty) → Prop
  | [] => true
  | x::xs => ¬(List.mem x xs) ∧ noDups xs

abbrev isSimplePath (p : List Vertex) (g : Graph) : Prop :=
  isPath p g ∧
  noDups p

abbrev isSimplePathFromTo (v1 v2 : Vertex) (p : List Vertex) (g : Graph) :=
  isPathFromTo v1 v2 p g ∧
  noDups p

abbrev existsPath (v1 v2 : Vertex) (g : Graph) : Prop :=
  ∃ (p : List Vertex), isPathFromTo v1 v2 p g

-- convert a path of vertices into a path of edges
abbrev pathVToPathE : (p : List Vertex) → List Edge
  | []         => []
  | [v]        => []
  | v1::v2::vs => (v1,v2) :: pathVToPathE (v2::vs)

--------------------------------------------------------------------------------

end Graph
