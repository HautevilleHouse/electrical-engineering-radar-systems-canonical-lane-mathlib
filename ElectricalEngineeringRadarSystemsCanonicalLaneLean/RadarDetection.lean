import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarDetectionPackage where
  detectionThreshold : Float
  falseAlarmRate : Float
  detectionProbability : Float
  integrationType : String
  cfarTechnique : String
  noisePower : Float
  targetModel : String

structure RadarDetectionEvidence (D : RadarDetectionPackage) where
  detectionThresholdClosed : D.detectionThreshold > 0
  falseAlarmRateClosed : D.falseAlarmRate > 0 ∧ D.falseAlarmRate < 1
  detectionProbabilityClosed : D.detectionProbability > 0 ∧ D.detectionProbability ≤ 1
  integrationTypeClosed : D.integrationType ∈ {"coherent", "noncoherent"}
  cfarTechniqueClosed : D.cfarTechnique ∈ {"CA", "GO", "SO", "OS"}
  noisePowerClosed : D.noisePower > 0
  targetModelClosed : D.targetModel ∈ {"Swerling0", "Swerling1", "Swerling2", "Swerling3", "Swerling4"}

def RadarDetectionClosed (D : RadarDetectionPackage) : Prop :=
  D.detectionThreshold > 0 ∧ (D.falseAlarmRate > 0 ∧ D.falseAlarmRate < 1) ∧
  (D.detectionProbability > 0 ∧ D.detectionProbability ≤ 1) ∧
  D.integrationType ∈ {"coherent", "noncoherent"} ∧
  D.cfarTechnique ∈ {"CA", "GO", "SO", "OS"} ∧
  D.noisePower > 0 ∧
  D.targetModel ∈ {"Swerling0", "Swerling1", "Swerling2", "Swerling3", "Swerling4"}

theorem radar_detection_closed_from_evidence (D : RadarDetectionPackage)
    (E : RadarDetectionEvidence D) : RadarDetectionClosed D := by
  refine And.intro E.detectionThresholdClosed
    (And.intro E.falseAlarmRateClosed
      (And.intro E.detectionProbabilityClosed
        (And.intro E.integrationTypeClosed
          (And.intro E.cfarTechniqueClosed
            (And.intro E.noisePowerClosed E.targetModelClosed)))))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
