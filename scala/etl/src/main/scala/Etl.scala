object Etl {
  def transform(intToStrings: Map[Int, Seq[String]]): Map[String, Int] = {
    intToStrings.foldLeft(Map.empty[String, Int]) {
      case (z: Map[String, Int], (value, chars)) =>
        chars.foldLeft(z) {
          case (b: Map[String, Int], char: String) =>
            b.updated(char.toLowerCase, value)
        }
    }
  }
}
