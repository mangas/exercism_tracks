/**
  * Created by filipe.azevedo on 20/06/2016.
  */
object Hamming {
  def compute(s: String, s1: String) = {
    require(s.length == s1.length)

    s.zip(s1).count{ case (x,y) => x != y }
  }
}
