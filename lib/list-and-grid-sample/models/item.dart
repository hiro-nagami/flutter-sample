class Item {
  int id;
  String title;
  String content;
  bool isDone;

  Item(this.id, this.title, this.content, this.isDone);

  changeState() {
    isDone = !isDone;
  }
}