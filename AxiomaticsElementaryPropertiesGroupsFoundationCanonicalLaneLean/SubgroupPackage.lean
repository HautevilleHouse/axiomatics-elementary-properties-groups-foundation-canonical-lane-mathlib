import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.GroupAxioms

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure SubgroupPackage {G : AdmissibleGroup} (P : GroupAxiomsPackage G) where
  subset : Set G.carrier
  containsOne : G.one ∈ subset
  closedUnderMul : ∀ a b, a ∈ subset → b ∈ subset → G.mul a b ∈ subset
  closedUnderInv : ∀ a, a ∈ subset → G.inv a ∈ subset

structure SubgroupEvidence {G : AdmissibleGroup} {P : GroupAxiomsPackage G} (S : SubgroupPackage P) where
  containsOneClosed : S.containsOne
  closedUnderMulClosed : S.closedUnderMul
  closedUnderInvClosed : S.closedUnderInv

def SubgroupClosed {G : AdmissibleGroup} {P : GroupAxiomsPackage G} (S : SubgroupPackage P) : Prop :=
  S.containsOne ∧ S.closedUnderMul ∧ S.closedUnderInv

theorem subgroup_closed_from_evidence {G : AdmissibleGroup} {P : GroupAxiomsPackage G} (S : SubgroupPackage P) (E : SubgroupEvidence S) :
    SubgroupClosed S := by
  exact And.intro E.containsOneClosed (And.intro E.closedUnderMulClosed E.closedUnderInvClosed)

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse