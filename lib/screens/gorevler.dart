class Gorevler {
  int id;
  String gorev;

  Gorevler.withGorev(String gorev) {
    this.gorev = gorev;
  }
  Gorevler.withId(String gorev, int id) {
    this.gorev = gorev;
    this.id = id;
  }

  Gorevler.withOut() {}
}
