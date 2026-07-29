import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarWaveformPackage where
  pulseWidth : Float
  bandwidth : Float
  modulationType : String
  pulseRepetitionInterval : Float
  carrierFrequency : Float
  adcSampleRate : Float
  pulseCompressionRatio : Float

structure RadarWaveformEvidence (W : RadarWaveformPackage) where
  pulseWidthClosed : W.pulseWidth > 0
  bandwidthClosed : W.bandwidth > 0
  modulationTypeClosed : W.modulationType ∈ {"LFM", "NLFM", "PhaseCoded", "Frank"}
  pulseRepetitionIntervalClosed : W.pulseRepetitionInterval > 0
  carrierFrequencyClosed : W.carrierFrequency > 0
  adcSampleRateClosed : W.adcSampleRate > 0
  pulseCompressionRatioClosed : W.pulseCompressionRatio ≥ 1.0

def RadarWaveformClosed (W : RadarWaveformPackage) : Prop :=
  W.pulseWidth > 0 ∧ W.bandwidth > 0 ∧
  W.modulationType ∈ {"LFM", "NLFM", "PhaseCoded", "Frank"} ∧
  W.pulseRepetitionInterval > 0 ∧ W.carrierFrequency > 0 ∧
  W.adcSampleRate > 0 ∧ W.pulseCompressionRatio ≥ 1.0

theorem radar_waveform_closed_from_evidence (W : RadarWaveformPackage)
    (E : RadarWaveformEvidence W) : RadarWaveformClosed W := by
  exact And.intro E.pulseWidthClosed
    (And.intro E.bandwidthClosed
      (And.intro E.modulationTypeClosed
        (And.intro E.pulseRepetitionIntervalClosed
          (And.intro E.carrierFrequencyClosed
            (And.intro E.adcSampleRateClosed E.pulseCompressionRatioClosed)))))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
