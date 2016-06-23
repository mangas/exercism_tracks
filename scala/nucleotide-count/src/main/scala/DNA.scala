/**
  * Created by fa on 6/23/16.
  */
class DNA(s: String) {

  val valid = "ACGT"
  require(s.forall(valid contains _ ))

  val emptyMap = valid.map((_,0))
  val dna = (emptyMap ++ s.groupBy( (x) => x).mapValues(_.length)).toMap

  def nucleotideCounts(): Map[Char, Int] = dna
  def nucleotideCounts(c: Char): Int = {
    require(valid contains c)
    dna.getOrElse(c, 0)
  }
}
