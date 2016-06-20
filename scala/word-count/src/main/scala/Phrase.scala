/**
  * Created by filipe.azevedo on 20/06/2016.
  */
class Phrase(sentence: String) {

  val separator = sentence.find(_==' ').getOrElse(',')

  def wordCount: Map[String, Int] = {

    sentence
      .collect {
        case x if (isAllowed(x)) => x.toLower
      }
      .split(s"${separator}+")
      .groupBy( (w: String) => w )
      .map { case (word, words) => (word, words.length) }
  }

  def isAllowed(x: Char): Boolean =
    x.isLetterOrDigit || x == separator || x == '''
}
