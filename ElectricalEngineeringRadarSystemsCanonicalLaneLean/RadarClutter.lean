import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarClutterPackage where
  clutterType : String
  clutterDistribution : String
  clutterPower : Float
  clutterVelocitySpread : Float
  clutterMapResolution : Float
  mtpFilterLength : Nat
  stcEnabled : Bool

structure RadarClutterEvidence (C : RadarClutterPackage) where
  clutterTypeClosed : C.clutterType ∈ {"Land", "Sea", "Weather", "Chaff"}
  clutterDistributionClosed : C.clutterDistribution ∈ {"Rayleigh", "Weibull", "LogNormal", "KDistribution"}
  clutterPowerClosed : C.clutterPower > 0
  clutterVelocitySpreadClosed : C.clutterVelocitySpread > 0
  clutterMapResolutionClosed : C.clutterMapResolution > 0
  mtpFilterLengthClosed : C.mtpFilterLength > 0
  stcEnabledClosed : C.stcEnabled = true

def RadarClutterClosed (C : RadarClutterPackage) : Prop :=
  C.clutterType ∈ {"Land", "Sea", "Weather", "Chaff"} ∧
  C.clutterDistribution ∈ {"Rayleigh", "Weibull", "LogNormal", "KDistribution"} ∧
  C.clutterPower > 0 ∧ C.clutterVelocitySpread > 0 ∧
  C.clutterMapResolution > 0 ∧ C.mtpFilterLength > 0 ∧
  C.stcEnabled = true

theorem radar_clutter_closed_from_evidence (C : RadarClutterPackage)
    (E : RadarClutterEvidence C) : RadarClutterClosed C := by
  refine And.intro E.clutterTypeClosed
    (And.intro E.clutterDistributionClosed
      (And.intro E.clutterPowerClosed
        (And.intro E.clutterVelocitySpreadClosed
          (And.intro E.clutterMapResolutionClosed
            (And.intro E.mtpFilterLengthClosed E.stcEnabledClosed)))))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse
