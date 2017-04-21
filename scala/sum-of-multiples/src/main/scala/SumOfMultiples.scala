object SumOfMultiples {
  def sumOfMultiples(factors: Set[Int], limit: Int): Int =
    (0 until limit).filter(
      (n: Int) => factors.exists( i => n%i==0 )
    ).sum
}

