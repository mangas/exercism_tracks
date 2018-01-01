package bob

import (
	"strings"
	"unicode"
)

func Hey(remark string) string {

	noSpaces := strings.Join(strings.Fields(remark), "")
	allLetters := strings.Map(noPunct, noSpaces)
	noNumbers := strings.TrimSpace(strings.Map(remNumbers, allLetters))

	switch {
	case len(noSpaces) == 0:
		return "Fine. Be that way!"
	case len(allLetters) == 0:
		if strings.HasSuffix(remark, "?") {
			return "Sure."
		}

		return "Whoa, chill out !"

	case allLetters == strings.ToUpper(allLetters) && len(noNumbers) != 0:
		if !strings.HasSuffix(remark, "?") {
			return "Whoa, chill out!"
		}

		return "Calm down, I know what I'm doing!"

	case strings.HasSuffix(noSpaces, "?"):
		return "Sure."
	default:
		return "Whatever."
	}

}

func remNumbers(r rune) rune {
	switch {
	case unicode.IsNumber(r):
		return -1
	default:
		return r
	}
}

func noPunct(r rune) rune {
	switch {
	case unicode.IsPunct(r):
		return -1
	default:
		return r
	}
}
