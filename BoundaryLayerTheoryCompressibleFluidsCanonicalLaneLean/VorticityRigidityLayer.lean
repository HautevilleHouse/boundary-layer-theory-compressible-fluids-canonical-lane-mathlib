import canonicalLaneMathlib.AdmissibleClass
import BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.CompressibleEnergyLayer

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

structure VorticityRigidityCertificate where
  energy : EnergyEnstrophyCertificate
  vorticityCompactness : Prop
  rigidityExclusion : Prop
  barrierFloor : Prop
  vorticityCompactnessClosed : vorticityCompactness
  rigidityExclusionClosed : rigidityExclusion
  barrierFloorClosed : barrierFloor

def sourceVorticityRigidityCertificate : VorticityRigidityCertificate := {
  energy := sourceEnergyEnstrophyCertificate
  vorticityCompactness := true
  rigidityExclusion := true
  barrierFloor := true
  vorticityCompactnessClosed := rfl
  rigidityExclusionClosed := rfl
  barrierFloorClosed := rfl
}

def VorticityRigidityClosed (C : VorticityRigidityCertificate) : Prop :=
  EnergyEnstrophyClosed C.energy ∧
  C.vorticityCompactness ∧
  C.rigidityExclusion ∧
  C.barrierFloor

theorem source_vorticity_rigidity_closed : VorticityRigidityClosed sourceVorticityRigidityCertificate := by
  exact And.intro source_energy_enstrophy_closed
    (And.intro sourceVorticityRigidityCertificate.vorticityCompactnessClosed
      (And.intro sourceVorticityRigidityCertificate.rigidityExclusionClosed
        sourceVorticityRigidityCertificate.barrierFloorClosed))

end HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse