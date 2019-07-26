// Package triangle contains function to identify the kind of the triangle
package triangle

import "math"

// Kind is the type of triangle (int)
type Kind int

const (
	// Equ means Equilateral triangle
	Equ = iota
	// Iso means isosceles triangle
	Iso
	// Sca is scalene triangle
	Sca
	// NaT is not a triangle
	NaT
)

// KindFromSides identifies the kind of triangle
func KindFromSides(a, b, c float64) Kind {
	if math.IsInf(a+b+c, 0) || math.IsNaN(a+b+c) || a+b < c || a+c < b || b+c < a || a+b+c == 0 {
		return NaT
	}
	if a == b && a == c {
		return Equ
	}
	if a == b || a == c || b == c {
		return Iso
	}
	return Sca
}
