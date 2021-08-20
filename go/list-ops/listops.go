package listops

type IntList []int
type binFunc func(int, int) int

func (il IntList) Foldr(fn binFunc, zero int) int {
	if len(il) == 0 {
		return zero
	}
	total := fn(il[len(il)-1], zero)
	for i := len(il) - 2; i >= 0; i-- {
		total = fn(il[i], total)
	}

	return total
}

func (il IntList) Foldl(fn binFunc, zero int) int {
	if len(il) == 0 {
		return zero
	}

	total := fn(zero, il[0])
	for _, i := range il[1:] {
		total = fn(total, i)
	}

	return total
}

type predFunc func(a int) bool

func (il IntList) Filter(pf predFunc) IntList {
	res := IntList{}
	for _, i := range il {
		if pf(i) {
			res = append(res, i)
		}
	}
	return res
}

func (il IntList) Length() int {
	return len(il)
}

type unaryFunc func(i int) int

func (il IntList) Map(fn unaryFunc) IntList {
	res := IntList{}
	for _, i := range il {
		res = append(res, fn(i))
	}

	return res
}

func (il IntList) Reverse() IntList {
	res := IntList{}
	for i := len(il) - 1; i >= 0; i-- {
		res = append(res, il[i])
	}
	return res
}

func (il IntList) Append(i IntList) IntList {
	if len(il) == 0 {
		return i
	}

	return append(il, i...)
}

func (il IntList) Concat(ls []IntList) IntList {
	res := il
	for _, l := range ls {
		res = append(res, l...)
	}

	return res
}
