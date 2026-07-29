import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarAdmittedObject where
  radarSystem : Type
  topology : TopologicalSpace radarSystem
  transmittedWaveform : Prop
  receivedSignal : Prop
  detectionThreshold : Prop
  conclusion : detectionThreshold

structure AdmissibleClass where
  object : RadarAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  RadarWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def RadarWitnessClosed (O : RadarAdmittedObject) : Prop :=
  O.detectionThreshold

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
