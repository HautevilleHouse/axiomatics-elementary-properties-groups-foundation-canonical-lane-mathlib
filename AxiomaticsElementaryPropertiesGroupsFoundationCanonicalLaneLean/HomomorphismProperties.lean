import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure HomomorphismStruct (G H : Type u) (P : GroupPackage G) (Q : GroupPackage H) where
  map : G → H
  respectsMul : ∀ a b : G, map (P.axioms.mul a b) = Q.axioms.mul (map a) (map b)
  respectsOne : map P.axioms.one = Q.axioms.one
  respectsInv : ∀ a : G, map (P.axioms.inv a) = Q.axioms.inv (map a)

structure HomomorphismPackage (G H : Type u) (P : GroupPackage G) (Q : GroupPackage H) where
  hom : HomomorphismStruct G H P Q
  kernelIsSubgroup : Prop
  imageIsSubgroup : Prop

structure HomomorphismEvidence (G H : Type u) (P : GroupPackage G) (Q : GroupPackage H) (Hp : HomomorphismPackage G H P Q) where
  kernelIsSubgroupClosed : Hp.kernelIsSubgroup
  imageIsSubgroupClosed : Hp.imageIsSubgroup

def HomomorphismClosed (G H : Type u) (P : GroupPackage G) (Q : GroupPackage H) (Hp : HomomorphismPackage G H P Q) : Prop :=
  Hp.kernelIsSubgroup ∧ Hp.imageIsSubgroup

theorem homomorphism_closed_from_evidence (G H : Type u) (P : GroupPackage G) (Q : GroupPackage H) (Hp : HomomorphismPackage G H P Q) (E : HomomorphismEvidence G H P Q Hp) : HomomorphismClosed G H P Q Hp := by
  exact And.intro E.kernelIsSubgroupClosed E.imageIsSubgroupClosed

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse