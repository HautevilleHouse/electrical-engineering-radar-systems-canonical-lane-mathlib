import ElectricalEngineeringRadarSystemsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure WaveformDesignPackage where
  matchedFilterCorrelation : Prop
  ambiguityFunction : Prop
  pulseRepetitionInterval : Prop
  waveformBandwidth : Prop

structure WaveformDesignEvidence (W : WaveformDesignPackage) where
  matchedFilterCorrelationClosed : W.matchedFilterCorrelation
  ambiguityFunctionClosed : W.ambiguityFunction
  pulseRepetitionIntervalClosed : W.pulseRepetitionInterval
  waveformBandwidthClosed : W.waveformBandwidth

def WaveformDesignClosed (W : WaveformDesignPackage) : Prop :=
  W.matchedFilterCorrelation ∧ W.ambiguityFunction ∧ W.pulseRepetitionInterval ∧ W.waveformBandwidth

theorem waveform_design_closed_from_evidence
    (W : WaveformDesignPackage) (E : WaveformDesignEvidence W) :
    WaveformDesignClosed W := by
  exact And.intro E.matchedFilterCorrelationClosed
    (And.intro E.ambiguityFunctionClosed
      (And.intro E.pulseRepetitionIntervalClosed E.waveformBandwidthClosed))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse