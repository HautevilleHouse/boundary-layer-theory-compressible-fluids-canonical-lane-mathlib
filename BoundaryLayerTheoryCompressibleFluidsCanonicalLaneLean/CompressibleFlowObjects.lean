import HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.MathlibObjects
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

abbrev Space2 := Fin 2 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space2 → ℝ
abbrev VectorField := Time → Space2 → Space2
abbrev DensityField := ScalarField
abbrev TemperatureField := ScalarField
abbrev PressureField := ScalarField

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

def constantDensity : DensityField := fun _ _ => 1.0
def constantTemperature : TemperatureField := fun _ _ => 1.0

structure CompressibleFlowOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  convection : VectorField → VectorField
  pressureGradient : PressureField → VectorField
  energyFlux : VectorField → ScalarField
  heatConduction : TemperatureField → ScalarField
  idempotentCondition : ∀ u, ((fun v => v) : VectorField → VectorField) u = u

def primitiveCompressibleOperators : CompressibleFlowOperators := {
  divergence := fun _ => zeroScalarField,
  gradient := fun _ => zeroVectorField,
  laplacian := fun u => u,
  timeDerivative := fun _ => zeroVectorField,
  convection := fun _ => zeroVectorField,
  pressureGradient := fun _ => zeroVectorField,
  energyFlux := fun _ => zeroScalarField,
  heatConduction := fun _ => zeroScalarField,
  idempotentCondition := fun u => rfl
}

structure BoundaryLayerFlow where
  density : DensityField
  velocity : VectorField
  temperature : TemperatureField
  pressure : PressureField
  viscosity : ℝ
  thermalConductivity : ℝ
  operators : CompressibleFlowOperators

def primitiveBoundaryLayerFlow : BoundaryLayerFlow := {
  density := constantDensity,
  velocity := zeroVectorField,
  temperature := constantTemperature,
  pressure := zeroScalarField,
  viscosity := 1,
  thermalConductivity := 1,
  operators := primitiveCompressibleOperators
}

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse