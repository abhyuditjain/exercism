package strand

import "strings"

// ToRNA converts a DNA string to RNA string
func ToRNA(dna string) string {
	return strings.NewReplacer("A", "U", "T", "A", "G", "C", "C", "G").Replace(dna)
}
