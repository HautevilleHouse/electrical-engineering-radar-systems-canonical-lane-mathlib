import ElectricalEngineeringRadarSystemsCanonicalLaneLean.RadarSystemAdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure DetectionPackage where
  targetPresent : Prop
  clutterRejected : Prop
  detectionThresholdMet : Prop
  falseAlarmRateControlled : Prop

structure DetectionEvidence (D : DetectionPackage) where
  targetPresentClosed : D.targetPresent
  clutterRejectedClosed : D.clutterRejected
  detectionThresholdMetClosed : D.detectionThresholdMet
  falseAlarmRateControlledClosed : D.falseAlarmRateControlled

def DetectionClosed (D : DetectionPackage) : Prop :=
  D.targetPresent ∧ D.clutterRejected ∧
  D.detectionThresholdMet ∧ D.falseAlarmRateControlled

theorem detection_closed_from_evidence (D : DetectionPackage) (E : DetectionEvidence D) :
    DetectionClosed D := by
  exact And.intro E.targetPresentClosed
    (And.intro E.clutterRejectedClosed
      (And.intro E.detectionThresholdMetClosed E.falseAlarmRateControlledClosed))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
