import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.GroupAxioms

namespace HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure HomomorphismPackage (G H : GroupAxiomsPackage) where
  map : G.group.carrier → H.group.carrier
  map_mul : ∀ a b, map (G.group.mul a b) = H.group.mul (map a) (map b)
  map_one : map G.group.e = H.group.e
  map_inv : ∀ a, map (G.group.inv a) = H.group.inv (map a)

structure HomomorphismEvidence {G H : GroupAxiomsPackage} (φ : HomomorphismPackage G H) where
  map_mul_closed : φ.map_mul
  map_one_closed : φ.map_one
  map_inv_closed : φ.map_inv

def HomomorphismClosed {G H : GroupAxiomsPackage} (φ : HomomorphismPackage G H) : Prop :=
  φ.map_mul ∧ φ.map_one ∧ φ.map_inv

theorem homomorphism_closed_from_evidence {G H : GroupAxiomsPackage} (φ : HomomorphismPackage G H) (E : HomomorphismEvidence φ) : HomomorphismClosed φ := by
  exact And.intro E.map_mul_closed (And.intro E.map_one_closed E.map_inv_closed)

end HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean