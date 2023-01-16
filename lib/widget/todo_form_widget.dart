import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  const TodoFormWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.onTitleChange,
    required this.onDescriptionChange,
    required this.onSave,
  }) : super(key: key);

  final String title;
  final String description;
  final ValueChanged<String> onTitleChange;
  final ValueChanged<String> onDescriptionChange;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            maxLines: 1,
            initialValue: title,
            onChanged: onTitleChange,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The title cannot be empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            maxLines: 3,
            initialValue: description,
            onChanged: onDescriptionChange,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Description',
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: onSave,
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
