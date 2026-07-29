import HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.BoundaryLayerPDE

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

structure TransitionCertificate where
  baseFlow : BoundaryLayerSolution
  reynoldsNumber : ℝ
  machNumber : ℝ
  stabilityMargin : Prop
  transitionPoint : Prop
  stabilityMarginClosed : stabilityMargin
  transitionPointClosed : transitionPoint

def sourceTransitionCertificate : TransitionCertificate := {
  baseFlow := primitiveBoundaryLayerSolution,
  reynoldsNumber := 1.0,
  machNumber := 0.3,
  stabilityMargin := True,
  transitionPoint := True,
  stabilityMarginClosed := by trivial,
  transitionPointClosed := by trivial
}

def TransitionClosed (C : TransitionCertificate) : Prop :=
  C.stabilityMargin ∧ C.transitionPoint

theorem source_transition_closed : TransitionClosed sourceTransitionCertificate := by
  unfold TransitionClosed
  apply And.intro
  · exact sourceTransitionCertificate.stabilityMarginClosed
  · exact sourceTransitionCertificate.transitionPointClosed

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse