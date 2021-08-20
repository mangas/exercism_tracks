import NumberType.NType

object PerfectNumbers {
  def classify(i: Int): NType = ???

  def factor(i: Int): Seq[Int] = ???
}


object NumberType {

  trait NType
  object Perfect extends NType
  object Deficient extends NType
  object Abundant extends NType

}