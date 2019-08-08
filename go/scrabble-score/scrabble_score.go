// Package scrabble gives the core for a word
package scrabble

import "strings"

// byte = uint8
var scoreMap = make(map[rune]int)

func init() {
	classes := map[string]int{
		"aeioulnrst": 1,
		"dg":         2,
		"bcmp":       3,
		"fhvwy":      4,
		"k":          5,
		"jx":         8,
		"qz":         10,
	}

	for letters, score := range classes {
		for _, letter := range letters {
			scoreMap[letter] = score
		}
	}
}

// Score gives the score for a word
func Score(word string) int {
	score := 0

	for _, v := range strings.ToLower(word) {
		score += scoreMap[v]
	}

	return score
}
