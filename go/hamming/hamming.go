package hamming

import "errors"

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("Different sizes")
	}

	diff := 0

	for i, v := range a {
		if v != rune(b[i]) {
			diff++
		}
	}

	return diff, nil
}
