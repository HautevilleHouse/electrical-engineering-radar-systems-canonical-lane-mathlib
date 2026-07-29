import ElectricalEngineeringRadarSystemsCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarDetectionTheoremStatement where
  sourceKey : String
  theoremName : String
  detectionClosed : Prop
  constrainedClosure : Prop

def radarDetectionTheoremStatement : RadarDetectionTheoremStatement :=
  { sourceKey := "electrical-engineering-radar-systems-canonical-lane",
    theoremName := "Radar Detection Constrained Closure",
    detectionClosed := True,
    constrainedClosure := True
  }

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse