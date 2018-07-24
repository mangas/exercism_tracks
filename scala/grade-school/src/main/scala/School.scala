
class School {
  type DB = Map[Int, Seq[String]]

  private var store: DB = Map.empty

  def add(name: String, g: Int) =
    this.store = store.updated(g, store.getOrElse(g, Seq.empty) :+ name)


  def db: DB = store

  def grade(g: Int): Seq[String] = store.getOrElse(g, Seq.empty)

  def sorted: DB =
    store.toList.sortBy(_._1).map{ case (k: Int, v: Seq[String])=> (k, v.sorted) }.toMap
}
