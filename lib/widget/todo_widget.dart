import 'package:f_todo_provider/model/todo.dart';
import 'package:f_todo_provider/page/edit_todo_page.dart';
import 'package:f_todo_provider/provider/todos.dart';
import 'package:f_todo_provider/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.todo,
  });

  final Todo todo;

  void edit(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTodoPage(todo: todo),
      ),
    );
  }

  void delete(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.delete(todo);

    Utils.showSnackBar(context, 'Delete the task');
  }

  void toggleStatus(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    final isDone = provider.toggleStatus(todo);

    Utils.showSnackBar(
        context, isDone ? 'Task completed' : 'Task marked incomplete');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        key: Key(todo.id),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: edit,
              backgroundColor: Colors.green,
              label: 'Edit',
              icon: Icons.edit,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: delete,
              backgroundColor: Colors.red,
              label: 'Delete',
              icon: Icons.delete,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: (() {
            edit(context);
          }),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Checkbox(
                  value: todo.isDone,
                  onChanged: (_) {
                    toggleStatus(context);
                  },
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: const TextStyle(fontSize: 20, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
