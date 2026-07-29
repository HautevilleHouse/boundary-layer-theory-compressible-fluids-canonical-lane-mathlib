import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.FluidProperties
import HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.BoundaryLayerEquations

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

structure IntegralParameters where
  δ1 : ℝ -- displacement thickness
  δ2 : ℝ -- momentum thickness
  H : ℝ -- shape factor
  δ3 : ℝ -- energy thickness
  Cf : ℝ -- skin friction coefficient
  St : ℝ -- Stanton number

def displacementThickness (ρe : ℝ) (Ue : ℝ) (profile : BoundaryLayerProfile) : ℝ :=
  ∫ y, (1 - (profile.ρ * profile.u) / (ρe * Ue)) dy

def momentumThickness (ρe : ℝ) (Ue : ℝ) (profile : BoundaryLayerProfile) : ℝ :=
  ∫ y, (profile.ρ * profile.u / (ρe * Ue)) * (1 - profile.u / Ue) dy

def shapeFactor (δ1 : ℝ) (δ2 : ℝ) : ℝ := δ1 / δ2

def skinFrictionCoefficient (τw : ℝ) (ρe : ℝ) (Ue : ℝ) : ℝ := τw / (0.5 * ρe * Ue^2)

def stantonNumber (qw : ℝ) (ρe : ℝ) (Ue : ℝ) (cp : ℝ) (Taw : ℝ) (Tw : ℝ) : ℝ :=
  qw / (ρe * Ue * cp * (Taw - Tw))

def vonKarmanIntegral (δ2 : ℝ) (Cf : ℝ) (Ue : ℝ) (dUedx : ℝ) : Prop :=
  dδ2/dx + (2*δ2 + δ1) * dUedx / Ue = Cf / 2

structure IntegralLayerClosed where
  parameters : IntegralParameters
  momentumIntegralHolds : Prop
  energyIntegralHolds : Prop

def sourceIntegralLayer : IntegralLayerClosed := {
  parameters := {δ1:=0.0, δ2:=0.0, H:=1.0, δ3:=0.0, Cf:=0.0, St:=0.0},
  momentumIntegralHolds := True,
  energyIntegralHolds := True
}

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse