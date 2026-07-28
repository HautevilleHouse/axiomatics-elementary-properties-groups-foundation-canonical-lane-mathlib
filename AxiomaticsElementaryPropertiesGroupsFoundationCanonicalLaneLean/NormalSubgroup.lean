import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.GroupAxioms
import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.SubgroupStructure

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure NormalSubgroupPackage {G : Type u} (ax : GroupAxioms G) extends SubgroupPackage ax where
  normal : ∀ (a : G) (b : G), b ∈ carrier → ax.mul (ax.mul a b) (ax.inv a) ∈ carrier

def NormalSubgroupPackageClosed {G : Type u} {ax : GroupAxioms G} (N : NormalSubgroupPackage ax) : Prop :=
  SubgroupPackageClosed N.toSubgroupPackage ∧ N.normal

theorem normal_subgroup_package_closed_from_evidence {G : Type u} {ax : GroupAxioms G}
    (N : NormalSubgroupPackage ax) (h_sub : SubgroupPackageClosed N.toSubgroupPackage) (h_norm : N.normal) :
    NormalSubgroupPackageClosed N := by
  exact And.intro h_sub h_norm

structure QuotientGroupPackage {G : Type u} (ax : GroupAxioms G) (N : NormalSubgroupPackage ax) where
  coset : Set (Set G)
  mulCoset : Set G → Set G → Set G
  oneCoset : Set G
  invCoset : Set G → Set G
  wellDefined : Prop
  groupAxiomsQuotient : GroupAxioms (Set G)

def QuotientGroupPackageClosed {G : Type u} {ax : GroupAxioms G} {N : NormalSubgroupPackage ax}
    (Q : QuotientGroupPackage ax N) : Prop :=
  Q.wellDefined ∧ GroupAxiomsClosed (Set G) Q.groupAxiomsQuotient

theorem quotient_group_package_closed_from_evidence {G : Type u} {ax : GroupAxioms G} {N : NormalSubgroupPackage ax}
    (Q : QuotientGroupPackage ax N) (h_wd : Q.wellDefined) (h_ax : GroupAxiomsClosed (Set G) Q.groupAxiomsQuotient) :
    QuotientGroupPackageClosed Q := by
  exact And.intro h_wd h_ax

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse
