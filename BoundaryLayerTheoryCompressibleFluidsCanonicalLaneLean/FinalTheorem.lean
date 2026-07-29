import BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.PrandtlLayerClosure
import BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.BridgeLemmas
import BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean

def ConstrainedBoundaryLayerClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_boundary_layer_closure (A : AdmissibleClass) :
    ConstrainedBoundaryLayerClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryLayerTheoryCompressibleFluidsCanonicalLaneLean
end HautevilleHouse
