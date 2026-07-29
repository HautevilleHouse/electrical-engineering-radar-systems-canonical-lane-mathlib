import ElectricalEngineeringRadarSystemsCanonicalLaneLean.RadarDetectionPackage

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure SignalProcessingAnalyticCertificate (D : DetectionPackage) where
  matchedFilterOutput : Prop
  dopplerProcessing : Prop
  clutterMap : Prop
  matchedFilterOutputClosed : matchedFilterOutput
  dopplerProcessingClosed : dopplerProcessing
  clutterMapClosed : clutterMap
  detectionEvidence : DetectionEvidence D

def SignalProcessingAnalyticCertificateClosed {D : DetectionPackage}
    (C : SignalProcessingAnalyticCertificate D) : Prop :=
  C.matchedFilterOutput ∧ C.dopplerProcessing ∧ C.clutterMap ∧ DetectionClosed D

theorem signal_processing_analytic_certificate_closed
    {D : DetectionPackage} (C : SignalProcessingAnalyticCertificate D) :
    SignalProcessingAnalyticCertificateClosed C := by
  exact And.intro C.matchedFilterOutputClosed
    (And.intro C.dopplerProcessingClosed
      (And.intro C.clutterMapClosed (detection_closed_from_evidence D C.detectionEvidence)))

structure SignalProcessingEvidenceTerms {D : DetectionPackage} (C : SignalProcessingAnalyticCertificate D) where
  matchedFilterOutput : C.matchedFilterOutput
  dopplerProcessing : C.dopplerProcessing
  clutterMap : C.clutterMap
  detectionClosed : DetectionClosed D

def SignalProcessingAnalyticCertificate.evidenceTerms {D : DetectionPackage}
    (C : SignalProcessingAnalyticCertificate D) : SignalProcessingEvidenceTerms C :=
  { matchedFilterOutput := C.matchedFilterOutputClosed
    dopplerProcessing := C.dopplerProcessingClosed
    clutterMap := C.clutterMapClosed
    detectionClosed := detection_closed_from_evidence D C.detectionEvidence
  }

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
