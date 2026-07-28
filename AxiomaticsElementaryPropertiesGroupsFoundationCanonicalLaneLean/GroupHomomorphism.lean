import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean.GroupAxioms

namespace HautevilleHouse
namespace AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean

structure GroupHomomorphismPackage {G H : Type u} (axG : GroupAxioms G) (axH : GroupAxioms H) where
  map : G → H
  map_one : map axG.one = axH.one
  map_mul : ∀ a b : G, map (axG.mul a b) = axH.mul (map a) (map b)

def GroupHomomorphismPackageClosed {G H : Type u} {axG : GroupAxioms G} {axH : GroupAxioms H}
    (φ : GroupHomomorphismPackage axG axH) : Prop :=
  φ.map_one ∧ φ.map_mul

theorem homomorphism_package_closed_from_evidence {G H : Type u} {axG : GroupAxioms G} {axH : GroupAxioms H}
    (φ : GroupHomomorphismPackage axG axH) (h_one : φ.map_one) (h_mul : φ.map_mul) :
    GroupHomomorphismPackageClosed φ := by
  exact And.intro h_one h_mul

structure KernelImagePackage {G H : Type u} {axG : GroupAxioms G} {axH : GroupAxioms H}
    (φ : GroupHomomorphismPackage axG axH) where
  kernel : Set G
  image : Set H
  kernelClosed : ∀ a : G, a ∈ kernel ↔ φ.map a = axH.one
  imageClosed : ∀ b : H, b ∈ image ↔ ∃ a : G, φ.map a = b

def KernelImagePackageClosed {G H : Type u} {axG : GroupAxioms G} {axH : GroupAxioms H}
    {φ : GroupHomomorphismPackage axG axH} (KI : KernelImagePackage φ) : Prop :=
  KI.kernelClosed ∧ KI.imageClosed

theorem kernel_image_package_closed_from_evidence {G H : Type u} {axG : GroupAxioms G} {axH : GroupAxioms H}
    {φ : GroupHomomorphismPackage axG axH} (KI : KernelImagePackage φ)
    (h_ker : KI.kernelClosed) (h_im : KI.imageClosed) : KernelImagePackageClosed KI := by
  exact And.intro h_ker h_im

end AxiomaticsElementaryPropertiesGroupsFoundationCanonicalLaneLean
end HautevilleHouse
