import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.HomomorphismPackage

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure CosetPackage {G : AdmissibleGroup} {P : GroupAxiomsPackage G} (S : SubgroupPackage P) where
  leftCoset : G.carrier → Set G.carrier
  rightCoset : G.carrier → Set G.carrier
  leftCosetDefinition : ∀ g : G.carrier, leftCoset g = {x : G.carrier | ∃ h : G.carrier, h ∈ S.subset ∧ G.mul g h = x}
  rightCosetDefinition : ∀ g : G.carrier, rightCoset g = {x : G.carrier | ∃ h : G.carrier, h ∈ S.subset ∧ G.mul h g = x}

structure CosetEvidence {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} (C : CosetPackage S) where
  leftCosetDefinitionClosed : C.leftCosetDefinition
  rightCosetDefinitionClosed : C.rightCosetDefinition

def CosetClosed {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} (C : CosetPackage S) : Prop :=
  C.leftCosetDefinition ∧ C.rightCosetDefinition

theorem coset_closed_from_evidence {G : AdmissibleGroup} {P : GroupAxiomsPackage G} {S : SubgroupPackage P} (C : CosetPackage S) (E : CosetEvidence C) :
    CosetClosed C := by
  exact And.intro E.leftCosetDefinitionClosed E.rightCosetDefinitionClosed

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse