object ArmstrongNumbers {
  def isArmstrongNumber(i: Int): Boolean = {
    val s = i.toString.length

    i.toString.foldLeft(0.0) { case (z: Double, n: Char) =>
      z + Math.pow(n.asDigit, s)
    } == i
  }

}
