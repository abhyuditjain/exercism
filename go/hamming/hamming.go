// Package hamming provides the function to get the Hamming distance between 2 DNA Strings
package hamming

import "errors"

// Distance returns the hamming distance between 2 DNA strings
// If lengths are different, an error is thrown
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("Lengths different")
	}

	distance := 0

	for i := range a {
		if b[i] != a[i] {
			distance++
		}
	}
	return distance, nil
}
