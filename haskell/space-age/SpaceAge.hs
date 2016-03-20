module SpaceAge (Planet(..), ageOn) where

data Planet = Earth | Mercury | Venus | Mars | Jupiter | Saturn | Uranus | Neptune

earth :: Fractional a => a
earth = 31557600

ageOn :: (Fractional a) => Planet -> a -> a
ageOn Earth    = (/earth)
ageOn Mercury  = (/(0.2408467*earth))
ageOn Venus    = (/(0.61519726*earth))
ageOn Mars     = (/(1.8808158*earth))
ageOn Jupiter  = (/(11.862615*earth))
ageOn Saturn   = (/(29.447498*earth))
ageOn Uranus   = (/(84.016846*earth))
ageOn Neptune  = (/(164.79132*earth))