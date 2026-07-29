import ElectricalEngineeringRadarSystemsCanonicalLaneLean.RadarSystemAdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  RadarWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
