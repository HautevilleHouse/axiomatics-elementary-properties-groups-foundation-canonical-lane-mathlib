import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure GroupAdmittedObject where
  G : Type u
  P : GroupPackage G
  allPropertiesClosed : GroupClosed G P

structure GroupAdmissibleClass where
  object : GroupAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : GroupAdmissibleClass) : Prop :=
  GroupClosed A.object.G A.object.P

theorem bridge_from_admissible_class (A : GroupAdmissibleClass) : bridgeClosed A := by
  exact A.object.allPropertiesClosed

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse