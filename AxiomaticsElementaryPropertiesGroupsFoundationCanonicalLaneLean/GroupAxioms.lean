import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure GroupAxioms (G : Type u) where
  mul : G → G → G
  one : G
  inv : G → G
  mul_assoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)
  one_mul : ∀ a : G, mul one a = a
  mul_one : ∀ a : G, mul a one = a
  mul_left_inv : ∀ a : G, mul (inv a) a = one

structure GroupPackage (G : Type u) where
  axioms : GroupAxioms G
  leftCancel : ∀ a b c : G, axioms.mul a b = axioms.mul a c → b = c
  rightCancel : ∀ a b c : G, axioms.mul b a = axioms.mul c a → b = c

structure GroupEvidence (G : Type u) (P : GroupPackage G) where
  leftCancelClosed : P.leftCancel
  rightCancelClosed : P.rightCancel

def GroupClosed (G : Type u) (P : GroupPackage G) : Prop :=
  P.leftCancel ∧ P.rightCancel

theorem group_closed_from_evidence (G : Type u) (P : GroupPackage G) (E : GroupEvidence G P) : GroupClosed G P := by
  exact And.intro E.leftCancelClosed E.rightCancelClosed

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse