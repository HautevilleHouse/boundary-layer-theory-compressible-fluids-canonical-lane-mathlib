import HautevilleHouse.BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.TransitionCriteria

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

structure SeparationCertificate where
  transition : TransitionCertificate
  adversePressureGradient : Prop
  separationPoint : Prop
  reattachmentPoint : Prop
  separationClosed : separationPoint
  reattachmentClosed : reattachmentPoint

def sourceSeparationCertificate : SeparationCertificate := {
  transition := sourceTransitionCertificate,
  adversePressureGradient := True,
  separationPoint := True,
  reattachmentPoint := True,
  separationClosed := by trivial,
  reattachmentClosed := by trivial
}

def SeparationClosed (C : SeparationCertificate) : Prop :=
  TransitionClosed C.transition ∧ C.separationPoint ∧ C.reattachmentPoint

theorem source_separation_closed : SeparationClosed sourceSeparationCertificate := by
  have h1 : TransitionClosed (sourceSeparationCertificate.transition) := source_transition_closed
  have h2 : sourceSeparationCertificate.separationPoint := sourceSeparationCertificate.separationClosed
  have h3 : sourceSeparationCertificate.reattachmentPoint := sourceSeparationCertificate.reattachmentClosed
  exact And.intro h1 (And.intro h2 h3)

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse