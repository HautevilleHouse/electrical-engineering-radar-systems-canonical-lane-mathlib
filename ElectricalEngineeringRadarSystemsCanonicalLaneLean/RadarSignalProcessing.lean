import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarSignalProcessingPackage where
  waveformType : Type u
  matchedFilterResponse : Type v
  detectionThreshold : Prop
  rangeResolution : Prop
  dopplerResolution : Prop

structure RadarSignalProcessingEvidence (R : RadarSignalProcessingPackage) where
  waveformTypeDefined : True
  matchedFilterResponseDefined : True
  detectionThresholdClosed : R.detectionThreshold
  rangeResolutionClosed : R.rangeResolution
  dopplerResolutionClosed : R.dopplerResolution

def RadarSignalProcessingClosed (R : RadarSignalProcessingPackage) : Prop :=
  R.detectionThreshold ∧ R.rangeResolution ∧ R.dopplerResolution

theorem radar_signal_processing_closed_from_evidence
    (R : RadarSignalProcessingPackage) (E : RadarSignalProcessingEvidence R) :
    RadarSignalProcessingClosed R := by
  exact And.intro E.detectionThresholdClosed
    (And.intro E.rangeResolutionClosed E.dopplerResolutionClosed)

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse