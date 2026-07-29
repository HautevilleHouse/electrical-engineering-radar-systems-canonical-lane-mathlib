import HautevilleHouse.ElectricalEngineeringRadarSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure TrackingPackage where
  stateVector : ℝ⁴
  covarianceMatrix : ℝ⁴×⁴
  processNoise : ℝ⁴×⁴
  measurementNoise : ℝ⁴×⁴

structure TrackingEvidence (T : TrackingPackage) where
  stateFinite : ‖T.stateVector‖ < ∞
  covariancePositiveSemidefinite : ∀ v : ℝ⁴, DotProduct v (T.covarianceMatrix • v) ≥ 0
  processNoisePositiveSemidefinite : ∀ v : ℝ⁴, DotProduct v (T.processNoise • v) ≥ 0
  measurementNoisePositiveSemidefinite : ∀ v : ℝ⁴, DotProduct v (T.measurementNoise • v) ≥ 0

def TrackingClosed (T : TrackingPackage) : Prop :=
  ‖T.stateVector‖ < ∞ ∧
  (∀ v : ℝ⁴, DotProduct v (T.covarianceMatrix • v) ≥ 0) ∧
  (∀ v : ℝ⁴, DotProduct v (T.processNoise • v) ≥ 0) ∧
  (∀ v : ℝ⁴, DotProduct v (T.measurementNoise • v) ≥ 0)

theorem tracking_closed_from_evidence (T : TrackingPackage) (E : TrackingEvidence T) :
    TrackingClosed T := by
  exact And.intro E.stateFinite (And.intro E.covariancePositiveSemidefinite (And.intro E.processNoisePositiveSemidefinite E.measurementNoisePositiveSemidefinite))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse