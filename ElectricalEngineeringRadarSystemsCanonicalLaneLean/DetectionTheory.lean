import ElectricalEngineeringRadarSystemsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure DetectionTheoryPackage where
  likelihoodRatioTest : Prop
  constantFalseAlarmRate : Prop
  detectionProbability : Prop
  thresholdSetting : Prop

structure DetectionTheoryEvidence (D : DetectionTheoryPackage) where
  likelihoodRatioTestClosed : D.likelihoodRatioTest
  constantFalseAlarmRateClosed : D.constantFalseAlarmRate
  detectionProbabilityClosed : D.detectionProbability
  thresholdSettingClosed : D.thresholdSetting

def DetectionTheoryClosed (D : DetectionTheoryPackage) : Prop :=
  D.likelihoodRatioTest ∧ D.constantFalseAlarmRate ∧ D.detectionProbability ∧ D.thresholdSetting

theorem detection_theory_closed_from_evidence
    (D : DetectionTheoryPackage) (E : DetectionTheoryEvidence D) :
    DetectionTheoryClosed D := by
  exact And.intro E.likelihoodRatioTestClosed
    (And.intro E.constantFalseAlarmRateClosed
      (And.intro E.detectionProbabilityClosed E.thresholdSettingClosed))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse