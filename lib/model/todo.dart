// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  String id;
  DateTime createdTime;
  String title;

  String description;
  bool isDone;
  Todo({
    required this.id,
    required this.createdTime,
    required this.title,
    this.description = '',
    this.isDone = false,
  });
}
