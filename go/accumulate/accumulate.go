// Package accumulate provides function to upcase a collection of strings
package accumulate

// The type of function that is passed
type converter func(string) string

// Accumulate returns the given collection of strings upcased
func Accumulate(input []string, conv converter) []string {
	out := make([]string, len(input))
	for i, v := range input {
		out[i] = conv(v)
	}
	return out
}
