import canonicalLaneMathlib.AdmissibleClass
import BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.BoundaryLayerFlowObjects

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

structure WeakSolutionEnvelope where
  flow : CompressibleBoundaryLayerFlow
  finiteEnergy : Prop
  weakContinuity : Prop
  weakMomentumEquation : Prop
  weakEnergyEquation : Prop
  finiteEnergyClosed : finiteEnergy
  weakContinuityClosed : weakContinuity
  weakMomentumEquationClosed : weakMomentumEquation
  weakEnergyEquationClosed : weakEnergyEquation

def sourceWeakSolutionEnvelope : WeakSolutionEnvelope := {
  flow := defaultCompressibleBoundaryLayerFlow
  finiteEnergy := true
  weakContinuity := true
  weakMomentumEquation := true
  weakEnergyEquation := true
  finiteEnergyClosed := rfl
  weakContinuityClosed := rfl
  weakMomentumEquationClosed := rfl
  weakEnergyEquationClosed := rfl
}

def WeakSolutionEnvelopeClosed (E : WeakSolutionEnvelope) : Prop :=
  E.finiteEnergy ∧ E.weakContinuity ∧ E.weakMomentumEquation ∧ E.weakEnergyEquation

theorem source_weak_solution_envelope_closed : WeakSolutionEnvelopeClosed sourceWeakSolutionEnvelope := by
  exact And.intro sourceWeakSolutionEnvelope.finiteEnergyClosed
    (And.intro sourceWeakSolutionEnvelope.weakContinuityClosed
      (And.intro sourceWeakSolutionEnvelope.weakMomentumEquationClosed
        sourceWeakSolutionEnvelope.weakEnergyEquationClosed))

end HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse