package rectangles

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestRectAdd(t *testing.T) {
	r := Rect{}

	r.Add(Point{X: 0, Y: 0})
	r.Add(Point{X: 10, Y: 0})
	r.Add(Point{X: 0, Y: 5})
	r.Add(Point{X: 10, Y: 5})

	require.True(t, r.IsComplete())
}

func TestRectAddFail(t *testing.T) {
	r := Rect{}

	r.Add(Point{X: 0, Y: 0})
	r.Add(Point{X: 10, Y: 0})
	r.Add(Point{X: 10, Y: 5})
	r.Add(Point{X: 15, Y: 5})

	require.False(t, r.IsComplete())
}

func TestRectangles(t *testing.T) {
	for _, tc := range testCases {
		if actual := Count(tc.input); actual != tc.expected {
			t.Fatalf("FAIL: %s\nExpected: %#v\nActual: %#v", tc.description, tc.expected, actual)
		}
		t.Logf("PASS: %s", tc.description)
	}
}

func BenchmarkRectangles(b *testing.B) {
	for i := 0; i < b.N; i++ {
		for _, tc := range testCases {
			Count(tc.input)
		}
	}
}
