import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

abbrev Density := ℝ
abbrev Velocity := ℝ
abbrev Temperature := ℝ
abbrev Pressure := ℝ
abbrev Viscosity := ℝ
abbrev ThermalConductivity := ℝ
abbrev MachNumber := ℝ

structure CompressibleFluid where
  density : Density
  velocity : Velocity
  temperature : Temperature
  pressure : Pressure
  dynamicViscosity : Viscosity
  thermalConductivity : ThermalConductivity
  mach : MachNumber
  isIdealGas : Bool
  gamma : ℝ -- specific heat ratio
  prandtlNumber : ℝ

def zeroFluid : CompressibleFluid := {
  density := 1.0,
  velocity := 0.0,
  temperature := 300.0,
  pressure := 101325.0,
  dynamicViscosity := 1.8e-5,
  thermalConductivity := 0.026,
  mach := 0.0,
  isIdealGas := true,
  gamma := 1.4,
  prandtlNumber := 0.71
}

structure EquationOfState where
  p : Density → Temperature → Pressure
  dpdρ : Density → Temperature → ℝ
  dpdT : Density → Temperature → ℝ

def idealGasEOS : EquationOfState := {
  p := fun ρ T => ρ * T * 287.058,
  dpdρ := fun ρ T => T * 287.058,
  dpdT := fun ρ T => ρ * 287.058
}

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse