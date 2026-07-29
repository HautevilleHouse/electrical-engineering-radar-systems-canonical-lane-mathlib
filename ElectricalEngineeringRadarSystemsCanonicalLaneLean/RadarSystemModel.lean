import HautevilleHouse.ElectricalEngineeringRadarSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringRadarSystemsCanonicalLaneLean

structure RadarSystemPackage where
  transmitPower : ℝ
  antennaGain : ℝ
  targetRCS : ℝ
  noiseFigure : ℝ
  detectionThreshold : ℝ
  operatingWavelength : ℝ

structure RadarSystemEvidence (P : RadarSystemPackage) where
  transmitPowerPositive : P.transmitPower > 0
  antennaGainPositive : P.antennaGain > 0
  targetRCSPositive : P.targetRCS > 0
  noiseFigurePositive : P.noiseFigure > 0

def RadarSystemClosed (P : RadarSystemPackage) : Prop :=
  P.transmitPower > 0 ∧ P.antennaGain > 0 ∧ P.targetRCS > 0 ∧ P.noiseFigure > 0

theorem radar_system_closed_from_evidence (P : RadarSystemPackage) (E : RadarSystemEvidence P) :
    RadarSystemClosed P := by
  exact And.intro E.transmitPowerPositive (And.intro E.antennaGainPositive (And.intro E.targetRCSPositive E.noiseFigurePositive))

end ElectricalEngineeringRadarSystemsCanonicalLaneLean
end HautevilleHouse