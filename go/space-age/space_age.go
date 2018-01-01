package space

//Planet represents the Planet's name
type Planet string

var ratio = map[Planet]float64{
	"Earth":   1.0,
	"Mercury": 0.2408467,
	"Venus":   0.61519726,
	"Mars":    1.8808158,
	"Jupiter": 11.862615,
	"Saturn":  29.447498,
	"Uranus":  84.016846,
	"Neptune": 164.79132,
}

// Age returns Age in a specific Planet
func Age(seconds float64, planet Planet) float64 {
	return seconds / (31557600 * ratio[planet])
}
