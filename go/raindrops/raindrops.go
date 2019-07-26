package raindrops

import "strings"
import "strconv"

var translations = []struct {
	Factor int
	Word   string
}{
	{3, "Pling"},
	{5, "Plang"},
	{7, "Plong"},
}

// Convert converts a number into a string based on its factors
func Convert(a int) string {
	var result strings.Builder

	for _, translation := range translations {
		if a%translation.Factor == 0 {
			result.WriteString(translation.Word)
		}
	}

	if result.Len() == 0 {
		result.WriteString(strconv.Itoa(a))
	}

	return result.String()
}
