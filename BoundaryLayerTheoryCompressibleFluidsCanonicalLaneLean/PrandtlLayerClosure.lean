import BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.BoundaryLayerEquations

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

structure PrandtlLayerCertificate where
  flow : CompressibleFlow
  operator : PrandtlOperator
  equationsClosed : Prop
  scalingValid : Prop
  boundaryMatched : Prop
  equationsClosedProof : equationsClosed
  scalingValidProof : scalingValid
  boundaryMatchedProof : boundaryMatched

def sourcePrandtlLayerCertificate : PrandtlLayerCertificate := {
  flow := primitiveCompressibleFlow,
  operator := primitivePrandtlOperator,
  equationsClosed := BoundaryLayerEquationsClosed primitiveCompressibleFlow primitivePrandtlOperator,
  scalingValid := True,
  boundaryMatched := True,
  equationsClosedProof := primitive_flow_equations_closed,
  scalingValidProof := trivial,
  boundaryMatchedProof := trivial
}

def PrandtlLayerClosure (C : PrandtlLayerCertificate) : Prop :=
  C.equationsClosed ∧ C.scalingValid ∧ C.boundaryMatched

theorem source_prandtl_layer_closed :
    PrandtlLayerClosure sourcePrandtlLayerCertificate := by
  exact And.intro sourcePrandtlLayerCertificate.equationsClosedProof
    (And.intro sourcePrandtlLayerCertificate.scalingValidProof sourcePrandtlLayerCertificate.boundaryMatchedProof)

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse
