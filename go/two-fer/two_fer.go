// Package twofer provides function to return two-for-one string
package twofer

import "fmt"

// ShareWith function expects a string as a parameter and returns a string
// If name is given, the returned string is "One for <name>, one for me."
// If no name is given, the result should be "One for you, one for me."
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
