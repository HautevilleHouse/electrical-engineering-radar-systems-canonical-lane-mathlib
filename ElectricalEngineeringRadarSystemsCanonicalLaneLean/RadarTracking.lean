import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarTrackingPackage where
  filterType : String
  measurementNoiseCovariance : Float
  processNoiseCovariance : Float
  updateRate : Float
  maximumTracks : Nat
  dataAssociationMethod : String
  initializationMethod : String

structure RadarTrackingEvidence (T : RadarTrackingPackage) where
  filterTypeClosed : T.filterType ∈ {"Kalman", "ExtendedKalman", "UnscentedKalman", "Particle"}
  measurementNoiseCovarianceClosed : T.measurementNoiseCovariance > 0
  processNoiseCovarianceClosed : T.processNoiseCovariance > 0
  updateRateClosed : T.updateRate > 0
  maximumTracksClosed : T.maximumTracks > 0
  dataAssociationMethodClosed : T.dataAssociationMethod ∈ {"NN", "JPDA", "MHT"}
  initializationMethodClosed : T.initializationMethod ∈ {"2PD", "3PD", "Static"}

def RadarTrackingClosed (T : RadarTrackingPackage) : Prop :=
  T.filterType ∈ {"Kalman", "ExtendedKalman", "UnscentedKalman", "Particle"} ∧
  T.measurementNoiseCovariance > 0 ∧ T.processNoiseCovariance > 0 ∧
  T.updateRate > 0 ∧ T.maximumTracks > 0 ∧
  T.dataAssociationMethod ∈ {"NN", "JPDA", "MHT"} ∧
  T.initializationMethod ∈ {"2PD", "3PD", "Static"}

theorem radar_tracking_closed_from_evidence (T : RadarTrackingPackage)
    (E : RadarTrackingEvidence T) : RadarTrackingClosed T := by
  refine And.intro E.filterTypeClosed
    (And.intro E.measurementNoiseCovarianceClosed
      (And.intro E.processNoiseCovarianceClosed
        (And.intro E.updateRateClosed
          (And.intro E.maximumTracksClosed
            (And.intro E.dataAssociationMethodClosed E.initializationMethodClosed)))))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
