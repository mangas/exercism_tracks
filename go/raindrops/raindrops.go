package raindrops

import (
	"strconv"
	"strings"
)

var factors = []int{3, 5, 7}

// Convert finds raindrops
func Convert(number int) string {

	res := make([]string, 0)

	for _, v := range factors {
		if number%v == 0 {
			switch v {
			case 3:
				res = append(res, "Pling")
			case 5:
				res = append(res, "Plang")
			case 7:
				res = append(res, "Plong")
			}
		}
	}

	if len(res) == 0 {
		return strconv.Itoa(number)
	}

	return strings.Join(res, "")
}
