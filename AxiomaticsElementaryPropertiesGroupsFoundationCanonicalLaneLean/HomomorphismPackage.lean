import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.SubgroupPackage

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure HomomorphismPackage {G H : AdmissibleGroup} {GP : GroupAxiomsPackage G} {HP : GroupAxiomsPackage H} where
  map : G.carrier → H.carrier
  preservesMul : ∀ a b : G.carrier, map (G.mul a b) = H.mul (map a) (map b)
  preservesOne : map G.one = H.one

structure HomomorphismEvidence {G H : AdmissibleGroup} {GP : GroupAxiomsPackage G} {HP : GroupAxiomsPackage H} (φ : HomomorphismPackage GP HP) where
  preservesMulClosed : φ.preservesMul
  preservesOneClosed : φ.preservesOne

def HomomorphismClosed {G H : AdmissibleGroup} {GP : GroupAxiomsPackage G} {HP : GroupAxiomsPackage H} (φ : HomomorphismPackage GP HP) : Prop :=
  φ.preservesMul ∧ φ.preservesOne

theorem homomorphism_closed_from_evidence {G H : AdmissibleGroup} {GP : GroupAxiomsPackage G} {HP : GroupAxiomsPackage H} (φ : HomomorphismPackage GP HP) (E : HomomorphismEvidence φ) :
    HomomorphismClosed φ := by
  exact And.intro E.preservesMulClosed E.preservesOneClosed

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse