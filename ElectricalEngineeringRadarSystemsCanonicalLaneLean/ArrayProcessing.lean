import ElectricalEngineeringRadarSystemsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure ArrayProcessingPackage where
  beamformingTechnique : Prop
  directionOfArrivalEstimation : Prop
  arrayCalibration : Prop
  adaptiveNulling : Prop

structure ArrayProcessingEvidence (A : ArrayProcessingPackage) where
  beamformingTechniqueClosed : A.beamformingTechnique
  directionOfArrivalEstimationClosed : A.directionOfArrivalEstimation
  arrayCalibrationClosed : A.arrayCalibration
  adaptiveNullingClosed : A.adaptiveNulling

def ArrayProcessingClosed (A : ArrayProcessingPackage) : Prop :=
  A.beamformingTechnique ∧ A.directionOfArrivalEstimation ∧ A.arrayCalibration ∧ A.adaptiveNulling

theorem array_processing_closed_from_evidence
    (A : ArrayProcessingPackage) (E : ArrayProcessingEvidence A) :
    ArrayProcessingClosed A := by
  exact And.intro E.beamformingTechniqueClosed
    (And.intro E.directionOfArrivalEstimationClosed
      (And.intro E.arrayCalibrationClosed E.adaptiveNullingClosed))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse