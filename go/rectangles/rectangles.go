package rectangles

type Point struct {
	X, Y int
}

type Rect struct {
	Points []Point
}

func (r *Rect) Add(p Point) {
	if len(r.Points) >= 4 {
		return
	}

	if r.IsEdge(p) {
		r.Points = append(r.Points, p)
	}
}

func (r Rect) IsEdge(e Point) bool {
	if len(r.Points) == 0 {
		return true
	}

	var countX, countY int
	for _, p := range r.Points {
		if p.X == e.X {
			countX++
		}

		if p.Y == e.Y {
			countY++
		}
	}

	if len(r.Points) == 3 {
		return countY >= 1 && countX >= 1
	}

	return countY == 1 || countX == 1
}

func (r Rect) IsComplete() bool {
	return len(r.Points) == 4
}

func Count(s []string) int {
	bus := make(chan Point)
	go sweep(s, bus)

	var rs []*Rect
	for p := range bus {
		toAdd := []*Rect{{Points: []Point{p}}}
		for _, r := range rs {
			if r.IsEdge(p) {
				r2 := *r
				toAdd = append(toAdd, &r2)
				r.Add(p)
			}
		}
		rs = append(rs, toAdd...)
	}

	count := 0
	for _, r := range rs {
		if r.IsComplete() {
			count++
		}
	}

	return count
}

func sweep(s []string, bus chan Point) {
	for y, l := range s {
		for x, c := range l {
			if c != '+' {
				continue
			}

			bus <- Point{
				X: x,
				Y: y,
			}
		}
	}

	close(bus)
}
