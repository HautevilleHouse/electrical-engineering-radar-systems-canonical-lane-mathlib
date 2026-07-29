import ElectricalEngineeringRadarSystemsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

def ConstrainedRadarClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_radar_endgame (A : AdmissibleClass) :
    ConstrainedRadarClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse