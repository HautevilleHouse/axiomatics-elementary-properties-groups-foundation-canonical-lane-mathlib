import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.GroupAxioms

namespace HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure SubgroupPackage (G : GroupAxiomsPackage) where
  carrier : Set G.group.carrier
  one_mem : G.group.e ∈ carrier
  mul_mem : ∀ a b, a ∈ carrier → b ∈ carrier → G.group.mul a b ∈ carrier
  inv_mem : ∀ a, a ∈ carrier → G.group.inv a ∈ carrier

structure SubgroupEvidence {G : GroupAxiomsPackage} (H : SubgroupPackage G) where
  one_mem_closed : H.one_mem
  mul_mem_closed : H.mul_mem
  inv_mem_closed : H.inv_mem

def SubgroupClosed {G : GroupAxiomsPackage} (H : SubgroupPackage G) : Prop :=
  H.one_mem ∧ H.mul_mem ∧ H.inv_mem

theorem subgroup_closed_from_evidence {G : GroupAxiomsPackage} (H : SubgroupPackage G) (E : SubgroupEvidence H) : SubgroupClosed H := by
  exact And.intro E.one_mem_closed (And.intro E.mul_mem_closed E.inv_mem_closed)

end HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean