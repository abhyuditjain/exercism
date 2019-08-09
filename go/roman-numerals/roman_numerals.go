// Package romannumerals allows conversion to roman numeral
package romannumerals

import (
	"fmt"
)

var (
	m0 = []string{"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"}
	m1 = []string{"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"}
	m2 = []string{"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"}
	m3 = []string{"", "M", "MM", "MMM"}
)

// ToRomanNumeral converts a roman numeral string from
func ToRomanNumeral(n int) (string, error) {
	if n < 1 || n > 3000 {
		return "", fmt.Errorf("%d out of range for Roman numeral", n)
	}
	return m3[n%1e4/1e3] + m2[n%1e3/1e2] + m1[n%100/10] + m0[n%10], nil
}
