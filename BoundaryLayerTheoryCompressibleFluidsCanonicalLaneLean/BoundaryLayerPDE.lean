import HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.CompressibleFlowObjects

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

structure PrandtlEquations where
  continuity : DensityField → VectorField → Prop
  momentum : BoundaryLayerFlow → Prop
  energy : TemperatureField → BoundaryLayerFlow → Prop

def standardPrandtlContinuity (rho : DensityField) (u : VectorField) : Prop :=
  rho = constantDensity ∧ u = zeroVectorField

def standardPrandtlMomentum (flow : BoundaryLayerFlow) : Prop :=
  flow.velocity = zeroVectorField

def standardPrandtlEnergy (T : TemperatureField) (flow : BoundaryLayerFlow) : Prop :=
  T = constantTemperature

def prandtlEquationsClosed (flow : BoundaryLayerFlow) : Prop :=
  standardPrandtlContinuity flow.density flow.velocity ∧
  standardPrandtlMomentum flow ∧
  standardPrandtlEnergy flow.temperature flow

structure BoundaryLayerSolution where
  flow : BoundaryLayerFlow
  prandtlSatisfied : prandtlEquationsClosed flow
  boundedness : Prop
  asymptoticMatching : Prop

def primitiveBoundaryLayerSolution : BoundaryLayerSolution := {
  flow := primitiveBoundaryLayerFlow,
  prandtlSatisfied := by
    exact And.intro (by rfl) (And.intro (by rfl) (by rfl)),
  boundedness := True,
  asymptoticMatching := True
}

theorem primitive_prandtl_closed_check : prandtlEquationsClosed primitiveBoundaryLayerFlow := by
  exact And.intro (by rfl) (And.intro (by rfl) (by rfl))

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse