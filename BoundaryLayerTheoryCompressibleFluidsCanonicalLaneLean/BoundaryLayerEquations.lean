import BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

structure CompressibleFlow where
  density : ScalarField
  velocity : VectorField
  temperature : ScalarField
  viscosity : ℝ
  thermalConductivity : ℝ

def zeroDensity : ScalarField := fun _ _ => 0
def zeroVelocity : VectorField := fun _ _ _ => 0
def zeroTemperature : ScalarField := fun _ _ => 0

def primitiveCompressibleFlow : CompressibleFlow := {
  density := zeroDensity,
  velocity := zeroVelocity,
  temperature := zeroTemperature,
  viscosity := 1,
  thermalConductivity := 1
}

structure PrandtlOperator where
  convection : VectorField → VectorField
  diffusion : VectorField → VectorField
  pressureGradient : VectorField → VectorField

def primitivePrandtlOperator : PrandtlOperator := {
  convection := fun _ => zeroVelocity,
  diffusion := fun u => u,
  pressureGradient := fun _ => zeroVelocity
}

def BoundaryLayerEquationsClosed (f : CompressibleFlow) (op : PrandtlOperator) : Prop :=
  op.convection f.velocity = zeroVelocity ∧
  op.diffusion f.velocity = zeroVelocity ∧
  op.pressureGradient f.velocity = zeroVelocity

theorem primitive_flow_equations_closed :
    BoundaryLayerEquationsClosed primitiveCompressibleFlow primitivePrandtlOperator := by
  refine ⟨rfl, rfl, rfl⟩

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse
