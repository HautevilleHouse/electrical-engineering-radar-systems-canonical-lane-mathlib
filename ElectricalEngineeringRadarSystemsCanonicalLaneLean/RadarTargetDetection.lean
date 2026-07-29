import RadarSystemsCanonicalLaneLean.RadarWaveform

/-!
# Radar Target Detection Package
-/

namespace HautevilleHouse
namespace RadarSystemsCanonicalLaneLean

structure RadarTargetDetectionPackage {P : RadarSignalProcessingPackage}
    {W : RadarWaveformPackage P} where
  detectionProbability : Prop
  falseAlarmRate : Prop
  snrRequirement : Prop
  clutterRejection : Prop
  cfarImplementation : Prop

structure RadarTargetDetectionEvidence {P : RadarSignalProcessingPackage}
    {W : RadarWaveformPackage P} (D : RadarTargetDetectionPackage P W) where
  detectionProbabilityClosed : D.detectionProbability
  falseAlarmRateClosed : D.falseAlarmRate
  snrRequirementClosed : D.snrRequirement
  clutterRejectionClosed : D.clutterRejection
  cfarImplementationClosed : D.cfarImplementation

def RadarTargetDetectionClosed {P : RadarSignalProcessingPackage}
    {W : RadarWaveformPackage P} (D : RadarTargetDetectionPackage P W) : Prop :=
  D.detectionProbability ∧ D.falseAlarmRate ∧ D.snrRequirement ∧
  D.clutterRejection ∧ D.cfarImplementation

theorem radar_target_detection_closed_from_evidence
    {P : RadarSignalProcessingPackage} {W : RadarWaveformPackage P}
    (D : RadarTargetDetectionPackage P W) (E : RadarTargetDetectionEvidence D) :
    RadarTargetDetectionClosed D := by
  exact And.intro E.detectionProbabilityClosed
    (And.intro E.falseAlarmRateClosed
      (And.intro E.snrRequirementClosed
        (And.intro E.clutterRejectionClosed E.cfarImplementationClosed)))

end RadarSystemsCanonicalLaneLean
end HautevilleHouse