import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

def ConstrainedGroupClosure (A : GroupAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_group_endgame (A : GroupAdmissibleClass) : ConstrainedGroupClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse