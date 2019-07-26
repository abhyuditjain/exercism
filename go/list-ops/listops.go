// Package listops provides funtions to manipulate Integer lists
package listops

type unaryFunc func(x int) int
type binFunc func(x, y int) int
type predFunc func(x int) bool

// IntList is a list of int
type IntList []int

// Foldr folds the list from right to left
func (l IntList) Foldr(f binFunc, x int) int {
	for i := len(l) - 1; i >= 0; i-- {
		x = f(l[i], x)
	}
	return x
}

// Foldl folds the list from left to right
func (l IntList) Foldl(f binFunc, x int) int {
	for _, v := range l {
		x = f(x, v)
	}
	return x
}

// Filter returns the list with only items for which the predicate is true
func (l IntList) Filter(f predFunc) IntList {
	r := l[:0]

	for _, v := range l {
		if f(v) {
			r = append(r, v)
		}
	}
	return r
}

// Length returns the length of the list
func (l IntList) Length() int {
	return len(l)
}

// Map returns the list with the elements passed through the f function
func (l IntList) Map(f unaryFunc) IntList {
	for i, v := range l {
		l[i] = f(v)
	}

	return l
}

// Reverse reverses the list
func (l IntList) Reverse() IntList {
	for i := 0; i < len(l)/2; i++ {
		l[i], l[len(l)-i-1] = l[len(l)-i-1], l[i]
	}
	return l
}

// Append adds the given list to this list
func (l IntList) Append(k IntList) IntList {
	return append(l, k...)
}

// Concat adds the given lists to the list
func (l IntList) Concat(ks []IntList) IntList {
	for _, k := range ks {
		l = append(l, k...)
	}
	return l
}
