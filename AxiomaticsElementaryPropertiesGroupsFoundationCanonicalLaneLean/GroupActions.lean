import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.GroupAxioms

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure GroupActionPackage {G X : Type u} (axG : GroupAxioms G) where
  act : G → X → X
  act_one : ∀ x : X, act axG.one x = x
  act_mul : ∀ (a b : G) (x : X), act (axG.mul a b) x = act a (act b x)

def GroupActionPackageClosed {G X : Type u} {axG : GroupAxioms G} (A : GroupActionPackage G X axG) : Prop :=
  A.act_one ∧ A.act_mul

theorem group_action_package_closed_from_evidence {G X : Type u} {axG : GroupAxioms G}
    (A : GroupActionPackage G X axG) (h_one : A.act_one) (h_mul : A.act_mul) :
    GroupActionPackageClosed A := by
  exact And.intro h_one h_mul

structure OrbitStabilizerPackage {G X : Type u} {axG : GroupAxioms G} (A : GroupActionPackage G X axG) (x : X) where
  orbit : Set X
  stabilizer : Set G
  orbitDefined : orbit = { y : X | ∃ g : G, A.act g x = y }
  stabilizerDefined : stabilizer = { g : G | A.act g x = x }

def OrbitStabilizerPackageClosed {G X : Type u} {axG : GroupAxioms G} {A : GroupActionPackage G X axG} {x : X}
    (OS : OrbitStabilizerPackage A x) : Prop :=
  OS.orbitDefined ∧ OS.stabilizerDefined

theorem orbit_stabilizer_package_closed_from_evidence {G X : Type u} {axG : GroupAxioms G}
    {A : GroupActionPackage G X axG} {x : X} (OS : OrbitStabilizerPackage A x)
    (h_orb : OS.orbitDefined) (h_stab : OS.stabilizerDefined) :
    OrbitStabilizerPackageClosed OS := by
  exact And.intro h_orb h_stab

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse
