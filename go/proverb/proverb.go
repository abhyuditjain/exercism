// Package proverb contains function to print proverb
package proverb

import "fmt"

const (
	line     = "For want of a %s the %s was lost."
	lastLine = "And all for the want of a %s."
)

// Proverb returns the proverb based on the input provided.
// The length of the proverb depends on the input array
func Proverb(rhyme []string) []string {
	if len(rhyme) == 0 {
		return []string{}
	}

	proverb := make([]string, len(rhyme))

	proverb[len(rhyme)-1] = fmt.Sprintf(lastLine, rhyme[0])

	previousRhyme := rhyme[0]

	for i, currentRhyme := range rhyme[1:] {
		proverb[i] = fmt.Sprintf(line, previousRhyme, currentRhyme)
		previousRhyme = currentRhyme
	}

	return proverb
}
