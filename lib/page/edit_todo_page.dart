import 'package:f_todo_provider/model/todo.dart';
import 'package:f_todo_provider/provider/todos.dart';
import 'package:f_todo_provider/widget/todo_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({
    super.key,
    required this.todo,
  });
  final Todo todo;

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  void delete() {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.delete(widget.todo);

    Navigator.of(context).pop();
  }

  void save() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.update(widget.todo, title, description);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit todo'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: delete,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TodoFormWidget(
            description: description,
            title: title,
            onDescriptionChange: (value) {
              setState(() {
                description = value;
              });
            },
            onTitleChange: (value) {
              setState(() {
                title = value;
              });
            },
            onSave: save,
          ),
        ),
      ),
    );
  }
}
