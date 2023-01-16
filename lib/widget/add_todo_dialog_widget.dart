import 'package:f_todo_provider/model/todo.dart';
import 'package:f_todo_provider/provider/todos.dart';
import 'package:f_todo_provider/widget/todo_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({super.key});

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  void handleSave() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final todo = Todo(
      id: DateTime.now().toString(),
      createdTime: DateTime.now(),
      title: title,
      description: description,
    );

    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.add(todo);

    Navigator.of(context).pop();
  }

  void onTitleChange(String value) {
    setState(() {
      title = value;
    });
  }

  void onDescriptionChange(String value) {
    setState(() {
      description = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add todo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 8,
            ),
            TodoFormWidget(
              title: title,
              description: description,
              onDescriptionChange: onDescriptionChange,
              onTitleChange: onTitleChange,
              onSave: handleSave,
            ),
          ],
        ),
      ),
    );
  }
}
