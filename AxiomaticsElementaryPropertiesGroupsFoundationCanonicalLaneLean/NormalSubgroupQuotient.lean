import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure NormalSubgroupStruct (G : Type u) (P : GroupPackage G) (H : SubgroupStruct G P) where
  normal : ∀ g : G, ∀ h : G, h ∈ H.carrier → P.axioms.mul (P.axioms.mul g h) (P.axioms.inv g) ∈ H.carrier

structure QuotientGroupStruct (G : Type u) (P : GroupPackage G) (H : NormalSubgroupStruct G P) where
  quotientType : Type u
  quotientMul : quotientType → quotientType → quotientType
  quotientOne : quotientType
  quotientInv : quotientType → quotientType
  quotientGroupAxioms : GroupAxioms quotientType
  projectionHomomorphism : HomomorphismStruct G quotientType P (⟨quotientMul, quotientOne, quotientInv, quotientGroupAxioms⟩ : GroupPackage quotientType)

structure QuotientPackage (G : Type u) (P : GroupPackage G) (H : NormalSubgroupStruct G P) where
  quotient : QuotientGroupStruct G P H
  firstIsomorphismTheorem : Prop

structure NormalQuotientEvidence (G : Type u) (P : GroupPackage G) (H : NormalSubgroupStruct G P) (Qp : QuotientPackage G P H) where
  firstIsomorphismTheoremClosed : Qp.firstIsomorphismTheorem

def NormalQuotientClosed (G : Type u) (P : GroupPackage G) (H : NormalSubgroupStruct G P) (Qp : QuotientPackage G P H) : Prop :=
  Qp.firstIsomorphismTheorem

theorem normal_quotient_closed_from_evidence (G : Type u) (P : GroupPackage G) (H : NormalSubgroupStruct G P) (Qp : QuotientPackage G P H) (E : NormalQuotientEvidence G P H Qp) : NormalQuotientClosed G P H Qp := by
  exact E.firstIsomorphismTheoremClosed

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse