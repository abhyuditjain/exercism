// Package leap contains the function to check whether the year passed is a leap year or not
package leap

// IsLeapYear returns true if the year passed is a leap year
// else it returns false
func IsLeapYear(year int) bool {
	if year%4 == 0 {
		if year%100 == 0 && year%400 != 0 {
			return false
		}
		return true
	}
	return false
}
