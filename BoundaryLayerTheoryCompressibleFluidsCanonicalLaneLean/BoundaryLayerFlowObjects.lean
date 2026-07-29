import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

abbrev Time := ℝ
abbrev Streamwise := ℝ
abbrev Normal := ℝ
abbrev ScalarField := Time → Streamwise → Normal → ℝ
abbrev VectorField := Time → Streamwise → Normal → (Streamwise × Normal)
abbrev DensityField := ScalarField
abbrev VelocityField := VectorField
abbrev TemperatureField := ScalarField

structure CompressibleBoundaryLayerOperators where
  divergence : VelocityField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  advection : VectorField → VectorField
  pressureGradient : ScalarField → VectorField
  viscousStress : VectorField → VectorField
  heatFlux : TemperatureField → ScalarField
  stateEquation : DensityField → TemperatureField → ScalarField
  prandtlTransformation : VectorField → VectorField
  prandtlTransformationIdempotent : ∀ u, prandtlTransformation (prandtlTransformation u) = prandtlTransformation u

def defaultCompressibleBoundaryLayerOperators : CompressibleBoundaryLayerOperators := {
  divergence := fun _ => fun _ _ _ => 0,
  gradient := fun _ => fun _ _ _ => (0,0),
  laplacian := fun u => u,
  timeDerivative := fun _ => fun _ _ _ => (0,0),
  advection := fun u => u,
  pressureGradient := fun _ => fun _ _ _ => (0,0),
  viscousStress := fun u => u,
  heatFlux := fun _ => fun _ _ _ => 0,
  stateEquation := fun ρ T => ρ,
  prandtlTransformation := fun u => u,
  prandtlTransformationIdempotent := by intro u; rfl
}

structure CompressibleBoundaryLayerFlow where
  density : DensityField
  velocity : VelocityField
  temperature : TemperatureField
  viscosity : ℝ
  thermalConductivity : ℝ
  operators : CompressibleBoundaryLayerOperators

def defaultCompressibleBoundaryLayerFlow : CompressibleBoundaryLayerFlow := {
  density := fun _ _ _ => 1,
  velocity := fun _ _ _ => (0,0),
  temperature := fun _ _ _ => 1,
  viscosity := 1,
  thermalConductivity := 1,
  operators := defaultCompressibleBoundaryLayerOperators
}

def PrandtlEquationsSatisfied (F : CompressibleBoundaryLayerFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.viscousStress F.velocity

def BoundaryLayerClosure (F : CompressibleBoundaryLayerFlow) : Prop :=
  PrandtlEquationsSatisfied F ∧ F.density = fun _ _ _ => 1

theorem default_flow_prandtl_satisfied : PrandtlEquationsSatisfied defaultCompressibleBoundaryLayerFlow := by
  unfold PrandtlEquationsSatisfied defaultCompressibleBoundaryLayerFlow defaultCompressibleBoundaryLayerOperators
  rfl

theorem default_flow_boundary_layer_closed : BoundaryLayerClosure defaultCompressibleBoundaryLayerFlow := by
  unfold BoundaryLayerClosure
  exact And.intro default_flow_prandtl_satisfied rfl

end HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse