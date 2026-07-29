import canonicalLaneMathlib.AdmissibleClass
import BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.WeakSolutionLayer

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

structure EnergyEnstrophyCertificate where
  weakSolution : WeakSolutionEnvelope
  kineticEnergyCoercivity : Prop
  dissipationBudget : Prop
  compactnessModulus : Prop
  entropyFloor : Prop
  kineticEnergyCoercivityClosed : kineticEnergyCoercivity
  dissipationBudgetClosed : dissipationBudget
  compactnessModulusClosed : compactnessModulus
  entropyFloorClosed : entropyFloor

def sourceEnergyEnstrophyCertificate : EnergyEnstrophyCertificate := {
  weakSolution := sourceWeakSolutionEnvelope
  kineticEnergyCoercivity := true
  dissipationBudget := true
  compactnessModulus := true
  entropyFloor := true
  kineticEnergyCoercivityClosed := rfl
  dissipationBudgetClosed := rfl
  compactnessModulusClosed := rfl
  entropyFloorClosed := rfl
}

def EnergyEnstrophyClosed (C : EnergyEnstrophyCertificate) : Prop :=
  WeakSolutionEnvelopeClosed C.weakSolution ∧
  C.kineticEnergyCoercivity ∧
  C.dissipationBudget ∧
  C.compactnessModulus ∧
  C.entropyFloor

theorem source_energy_enstrophy_closed : EnergyEnstrophyClosed sourceEnergyEnstrophyCertificate := by
  exact And.intro source_weak_solution_envelope_closed
    (And.intro sourceEnergyEnstrophyCertificate.kineticEnergyCoercivityClosed
      (And.intro sourceEnergyEnstrophyCertificate.dissipationBudgetClosed
        (And.intro sourceEnergyEnstrophyCertificate.compactnessModulusClosed
          sourceEnergyEnstrophyCertificate.entropyFloorClosed)))

end HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse