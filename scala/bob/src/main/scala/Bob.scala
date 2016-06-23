/**
  * Created by fa on 6/17/16.
  */
class Bob {

  def hey(msg: String): String = msg match {
    case x if x.filterNot( _ == ' ').length == 0 => "Fine. Be that way!"
    case x if x.filter(_.isLetter).length == 0 => if (x.endsWith("?")) "Sure." else "Whatever."
    case x if x.filter(_.isLetter).forall(_.isUpper)  => "Whoa, chill out!"
    case x if x.endsWith("?") => "Sure."
    case _ => "Whatever."
  }
}