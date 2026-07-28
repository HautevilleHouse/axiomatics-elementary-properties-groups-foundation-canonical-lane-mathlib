import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.GroupAxioms

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure ProductGroupPackage (G H : Type u) (axG : GroupAxioms G) (axH : GroupAxioms H) where
  productSet : Type u
  proj1 : productSet → G
  proj2 : productSet → H
  productMul : productSet → productSet → productSet
  productOne : productSet
  productInv : productSet → productSet
  projRespectsMul : ∀ x y : productSet, proj1 (productMul x y) = axG.mul (proj1 x) (proj1 y) ∧
                                   proj2 (productMul x y) = axH.mul (proj2 x) (proj2 y)
  projRespectsOne : proj1 productOne = axG.one ∧ proj2 productOne = axH.one
  projRespectsInv : ∀ x : productSet, proj1 (productInv x) = axG.inv (proj1 x) ∧
                                     proj2 (productInv x) = axH.inv (proj2 x)

def ProductGroupPackageClosed {G H : Type u} {axG : GroupAxioms G} {axH : GroupAxioms H}
    (P : ProductGroupPackage G H axG axH) : Prop :=
  P.projRespectsMul ∧ P.projRespectsOne ∧ P.projRespectsInv

theorem product_group_package_closed_from_evidence {G H : Type u} {axG : GroupAxioms G} {axH : GroupAxioms H}
    (P : ProductGroupPackage G H axG axH) (h_mul : P.projRespectsMul) (h_one : P.projRespectsOne)
    (h_inv : P.projRespectsInv) : ProductGroupPackageClosed P := by
  exact And.intro h_mul (And.intro h_one h_inv)

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse
