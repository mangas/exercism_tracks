object Leap {
  def leapYear(year: Int): Boolean = {
    if (year%4!=0) return false

    if (year%400==0) return true

    year%100!=0
  }
}
