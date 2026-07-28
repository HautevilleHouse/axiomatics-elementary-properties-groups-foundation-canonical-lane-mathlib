import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure GroupAxiomsPackage where
  closureProperty : Prop
  associativityProperty : Prop
  identityProperty : Prop
  inverseProperty : Prop

structure GroupAxiomsEvidence (G : GroupAxiomsPackage) where
  closureClosed : G.closureProperty
  associativityClosed : G.associativityProperty
  identityClosed : G.identityProperty
  inverseClosed : G.inverseProperty

def GroupAxiomsClosed (G : GroupAxiomsPackage) : Prop :=
  G.closureProperty ∧ G.associativityProperty ∧ G.identityProperty ∧ G.inverseProperty

theorem group_axioms_closed_from_evidence (G : GroupAxiomsPackage)
    (E : GroupAxiomsEvidence G) : GroupAxiomsClosed G := by
  exact And.intro E.closureClosed
    (And.intro E.associativityClosed
      (And.intro E.identityClosed E.inverseClosed))

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse