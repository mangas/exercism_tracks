package acronym

import (
	"strings"
)

// Abbreviate should have a comment documenting it.
func Abbreviate(s string) string {

	words := strings.Fields(strings.Replace(s, "-", " ", -1))

	for i, w := range words {
		words[i] = string(w[0])
	}

	return strings.ToUpper(strings.Join(words, ""))
}
