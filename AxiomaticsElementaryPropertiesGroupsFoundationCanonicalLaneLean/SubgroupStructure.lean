import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure SubgroupStruct (G : Type u) (P : GroupPackage G) where
  carrier : Set G
  containsOne : P.axioms.one ∈ carrier
  closedUnderMul : ∀ a b, a ∈ carrier → b ∈ carrier → P.axioms.mul a b ∈ carrier
  closedUnderInv : ∀ a, a ∈ carrier → P.axioms.inv a ∈ carrier

structure SubgroupPackage (G : Type u) (P : GroupPackage G) where
  subgroup : SubgroupStruct G P
  subgroupIsGroup : Prop

structure SubgroupEvidence (G : Type u) (P : GroupPackage G) (S : SubgroupPackage G P) where
  subgroupIsGroupClosed : S.subgroupIsGroup

def SubgroupClosed (G : Type u) (P : GroupPackage G) (S : SubgroupPackage G P) : Prop :=
  S.subgroupIsGroup

theorem subgroup_closed_from_evidence (G : Type u) (P : GroupPackage G) (S : SubgroupPackage G P) (E : SubgroupEvidence G P S) : SubgroupClosed G P S := by
  exact E.subgroupIsGroupClosed

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse