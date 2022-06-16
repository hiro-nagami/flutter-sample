class Task {
  int id;
  String title;
  String content;
  bool isDone;

  Task(this.id, this.title, this.content, this.isDone);

  changeState() {
    isDone = !isDone;
  }
}
