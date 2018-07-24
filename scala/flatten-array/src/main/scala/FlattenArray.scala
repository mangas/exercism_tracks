object FlattenArray {
  def flatten(ints: Any): List[Any] = ints match {
    case null => Nil
    case Nil => Nil
    case x :: xs => flatten(x) ++ flatten(xs)
    case x => List(x)
  }

}
