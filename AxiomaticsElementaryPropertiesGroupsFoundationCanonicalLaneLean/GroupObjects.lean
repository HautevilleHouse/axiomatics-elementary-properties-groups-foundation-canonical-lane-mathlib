import AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure GroupStructure where
  carrier : Type
  mul : carrier → carrier → carrier
  inv : carrier → carrier
  one : carrier
  mul_assoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : carrier, mul one a = a
  mul_one : ∀ a : carrier, mul a one = a
  mul_left_inv : ∀ a : carrier, mul (inv a) a = one

def GroupIsAbelian (G : GroupStructure) : Prop :=
  ∀ a b : G.carrier, G.mul a b = G.mul b a

structure GroupAdmittedObject where
  group : GroupStructure
  abelianOrCounterexample : Prop
  conclusion : abelianOrCounterexample ∨ ¬ GroupIsAbelian group

def GroupWitnessClosed (O : GroupAdmittedObject) : Prop :=
  O.abelianOrCounterexample ∨ ¬ GroupIsAbelian O.group

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse