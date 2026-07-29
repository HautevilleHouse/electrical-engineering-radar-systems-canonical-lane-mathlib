import Mathlib

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarAdmittedObject where
  radarSystemModel : Prop
  detectionCapability : Prop
  resolutionLimit : Prop
  conclusion : radarSystemModel ∧ detectionCapability ∧ resolutionLimit

structure AdmissibleClass where
  object : RadarAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def RadarWitnessClosed (O : RadarAdmittedObject) : Prop :=
  O.conclusion

def admittedClosure (A : AdmissibleClass) : Prop :=
  RadarWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse