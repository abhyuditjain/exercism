// Package gigasecond provides function to get time at which someone has lived for a gigasecond
package gigasecond

import "time"

// AddGigasecond returns time after adding gigasecond to the provided time
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * 1e9)
}
