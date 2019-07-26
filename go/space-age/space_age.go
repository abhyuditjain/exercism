package space

// Planet type is a string
type Planet string

var planetOrbitalPeriods = map[Planet]float64{
	"Mercury": 0.2408467,
	"Venus":   0.61519726,
	"Earth":   1,
	"Mars":    1.8808158,
	"Jupiter": 11.862615,
	"Saturn":  29.447498,
	"Uranus":  84.016846,
	"Neptune": 164.79132,
}

func secondsToYears(sec float64) float64 {
	return sec / (60 * 60 * 24 * 365.25)
}

// Age converts age (in seconds) to age in years of the Planet that is passed
func Age(ageInSeconds float64, planet Planet) float64 {
	return secondsToYears(ageInSeconds) / planetOrbitalPeriods[planet]
}
