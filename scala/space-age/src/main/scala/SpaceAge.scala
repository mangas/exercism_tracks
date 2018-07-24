object SpaceAge {

  val earth: Double = 31557600

  private def calc(year: Double, fraction: Double): Double =
    BigDecimal(year/(earth*fraction)).setScale(2, BigDecimal.RoundingMode.HALF_UP).toDouble
  
  def onNeptune(year: Double): Double = calc(year,164.79132)

  def onUranus(year: Double): Double = calc(year, 84.016846)

  def onSaturn(year: Double): Double = calc(year,29.447498)

  def onJupiter(year: Double): Double = calc(year,11.862615)

  def onMars(year: Double): Double = calc(year,1.8808158)

  def onVenus(year: Double): Double = calc(year,0.61519726)

  def onMercury(year: Double): Double = calc(year,0.2408467)

  def onEarth(year: Double): Double = calc(year, 1)

}
