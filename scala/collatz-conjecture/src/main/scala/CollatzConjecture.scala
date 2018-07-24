object CollatzConjecture {
  def steps(i: Int): Option[Int] = i match {
    case 1 => Some(0)
    case _ if i <= 0 => None
    case _ => Some(stepAndCount(i, 0))
  }

  def stepAndCount(i: Int, count: Int): Int = i match {
    case 1 => count
    case _ if i%2==0 => stepAndCount(i/2, count+1)
    case _ => stepAndCount(3*i+1, count+1)
  }
}
