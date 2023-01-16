import 'package:f_todo_provider/provider/todos.dart';
import 'package:f_todo_provider/widget/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? const Center(
            child: Text(
              'No completed task.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            itemBuilder: ((context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            }),
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemCount: todos.length,
          );
  }
}
