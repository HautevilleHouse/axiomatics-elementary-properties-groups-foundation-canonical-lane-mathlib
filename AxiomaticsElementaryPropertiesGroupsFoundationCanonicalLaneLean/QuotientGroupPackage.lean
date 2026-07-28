import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.CosetPackage

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure NormalSubgroupPackage {G : AdmissibleGroup} {P : GroupAxiomsPackage G} (S : SubgroupPackage P) where
  normal : ∀ g : G.carrier, ∀ h : G.carrier, h ∈ S.subset → G.mul (G.mul g h) (G.inv g) ∈ S.subset

structure NormalSubgroupEvidence {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} (N : NormalSubgroupPackage S) where
  normalClosed : N.normal

def NormalSubgroupClosed {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} (N : NormalSubgroupPackage S) : Prop :=
  N.normal

theorem normal_subgroup_closed_from_evidence {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} (N : NormalSubgroupPackage S) (E : NormalSubgroupEvidence N) :
    NormalSubgroupClosed N := by
  exact E.normalClosed

structure QuotientGroupPackage {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} (N : NormalSubgroupPackage S) where
  quotientSet : Type u
  quotientMul : quotientSet → quotientSet → quotientSet
  quotientOne : quotientSet
  quotientInv : quotientSet → quotientSet
  quotientMulAssoc : ∀ a b c : quotientSet, quotientMul (quotientMul a b) c = quotientMul a (quotientMul b c)
  quotientOneMul : ∀ a : quotientSet, quotientMul quotientOne a = a
  quotientMulOne : ∀ a : quotientSet, quotientMul a quotientOne = a
  quotientMulLeftInv : ∀ a : quotientSet, quotientMul (quotientInv a) a = quotientOne

structure QuotientGroupEvidence {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} {N : NormalSubgroupPackage S} (Q : QuotientGroupPackage N) where
  quotientMulAssocClosed : Q.quotientMulAssoc
  quotientOneMulClosed : Q.quotientOneMul
  quotientMulOneClosed : Q.quotientMulOne
  quotientMulLeftInvClosed : Q.quotientMulLeftInv

def QuotientGroupClosed {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} {N : NormalSubgroupPackage S} (Q : QuotientGroupPackage N) : Prop :=
  Q.quotientMulAssoc ∧ Q.quotientOneMul ∧ Q.quotientMulOne ∧ Q.quotientMulLeftInv

theorem quotient_group_closed_from_evidence {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} {N : NormalSubgroupPackage S} (Q : QuotientGroupPackage N) (E : QuotientGroupEvidence Q) :
    QuotientGroupClosed Q := by
  exact And.intro E.quotientMulAssocClosed (And.intro E.quotientOneMulClosed (And.intro E.quotientMulOneClosed E.quotientMulLeftInvClosed))

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse