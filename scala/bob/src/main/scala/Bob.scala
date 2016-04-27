class Bob {

  def hey(message: String): String = {
    message match {
      case msg: String => {
          case x if isShouting(x) => "Whoa, chill out!"
          case x if isStatement(x) => "respond to a statement"
          case x if isQuestion(x) => "Sure."
          case x if isSilence(x) => "Fine. Be that way!"
      }
      case _ => return null
    }
  }
}