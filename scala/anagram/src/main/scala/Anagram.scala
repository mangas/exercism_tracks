/**
  * Created by fa on 6/23/16.
  */
case class Anagram(s: String) {

  val lower_s = s.toLowerCase
  val occur = occurrences(s)

  def matches(seq: Seq[String]): Seq[String] =
    seq.filter( (x) => occurrences(x) == occur && x.toLowerCase != s )

  def occurrences(s: String) =
    s.map(_.toLower)
    .groupBy( (x) => x).mapValues(_.length)
}
