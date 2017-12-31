package gigasecond

import "time"

var SECS int = 1000000000

func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Duration(SECS) * time.Second)
}
