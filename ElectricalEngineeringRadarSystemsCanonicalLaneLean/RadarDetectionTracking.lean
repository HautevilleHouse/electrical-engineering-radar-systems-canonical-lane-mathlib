import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarDetectionTrackingPackage where
  detectionAlgorithm : Type u
  trackingFilter : Type v
  falseAlarmProbability : Prop
  detectionProbability : Prop
  trackInitiation : Prop
  trackMaintenance : Prop

structure RadarDetectionTrackingEvidence (D : RadarDetectionTrackingPackage) where
  detectionAlgorithmDefined : True
  trackingFilterDefined : True
  falseAlarmProbabilityClosed : D.falseAlarmProbability
  detectionProbabilityClosed : D.detectionProbability
  trackInitiationClosed : D.trackInitiation
  trackMaintenanceClosed : D.trackMaintenance

def RadarDetectionTrackingClosed (D : RadarDetectionTrackingPackage) : Prop :=
  D.falseAlarmProbability ∧ D.detectionProbability ∧
  D.trackInitiation ∧ D.trackMaintenance

theorem radar_detection_tracking_closed_from_evidence
    (D : RadarDetectionTrackingPackage) (E : RadarDetectionTrackingEvidence D) :
    RadarDetectionTrackingClosed D := by
  exact And.intro E.falseAlarmProbabilityClosed
    (And.intro E.detectionProbabilityClosed
      (And.intro E.trackInitiationClosed E.trackMaintenanceClosed))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse