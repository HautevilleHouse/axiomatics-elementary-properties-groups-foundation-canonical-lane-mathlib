import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure AdmissibleGroup where
  carrier : Type u
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier
  mul_assoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : carrier, mul one a = a
  mul_one : ∀ a : carrier, mul a one = a
  mul_left_inv : ∀ a : carrier, mul (inv a) a = one

structure AdmissibleClass where
  group : AdmissibleGroup
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GroupWitnessClosed A.group ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse