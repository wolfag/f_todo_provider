import 'package:f_todo_provider/model/todo.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      id: DateTime.now().toString(),
      createdTime: DateTime.now(),
      title: 'Buy Food 😋',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Todo(
      id: DateTime.now().toString(),
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Todo(
      id: DateTime.now().toString(),
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Todo(
      id: DateTime.now().toString(),
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];

  List<Todo> get todos =>
      _todos.where((element) => element.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((element) => element.isDone == true).toList();

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void delete(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void update(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
