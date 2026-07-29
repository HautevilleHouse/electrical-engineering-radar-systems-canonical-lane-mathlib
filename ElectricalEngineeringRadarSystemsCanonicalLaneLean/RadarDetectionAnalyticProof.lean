import ElectricalEngineeringRadarSystemsCanonicalLaneLean.RadarSignalProcessingEvidenceTerms

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure DetectionAnalyticCertificate (D : DetectionPackage) where
  targetDetection : Prop
  clutterRejection : Prop
  thresholdSetting : Prop
  falseAlarmControl : Prop
  targetDetectionClosed : targetDetection
  clutterRejectionClosed : clutterRejection
  thresholdSettingClosed : thresholdSetting
  falseAlarmControlClosed : falseAlarmControl
  detectionEvidence : DetectionEvidence D

def DetectionAnalyticCertificateClosed {D : DetectionPackage}
    (C : DetectionAnalyticCertificate D) : Prop :=
  C.targetDetection ∧ C.clutterRejection ∧ C.thresholdSetting ∧ C.falseAlarmControl ∧ DetectionClosed D

theorem detection_analytic_certificate_closed
    {D : DetectionPackage} (C : DetectionAnalyticCertificate D) :
    DetectionAnalyticCertificateClosed C := by
  exact And.intro C.targetDetectionClosed
    (And.intro C.clutterRejectionClosed
      (And.intro C.thresholdSettingClosed
        (And.intro C.falseAlarmControlClosed (detection_closed_from_evidence D C.detectionEvidence))))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
