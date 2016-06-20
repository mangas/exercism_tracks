/**
  * Created by Filipe Azevedo on 20/06/2016.
  */
object Pangrams {

  val az = 'a' to 'z'
  val azl = az.length

  def isPangram(s: String) = s match {
    case x if s.length >= azl => {
      val ls = s.toLowerCase
      az.forall( ls.contains(_) )
    }
    case _ => false
  }


}
