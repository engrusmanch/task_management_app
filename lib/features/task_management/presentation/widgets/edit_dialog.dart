import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/presentation/state/task_providers.dart';

void showEditTaskDialog(BuildContext context, WidgetRef ref, Task task) {
  TextEditingController titleController = TextEditingController(text: task.title);
  TextEditingController descriptionController = TextEditingController(text: task.description);
  String title = task.title;
  String description = task.description;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Edit Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              onChanged: (value) => title = value,
              decoration: InputDecoration(

                labelText: 'Title',

              ),
            ),
            TextField(
              controller: descriptionController,
              onChanged: (value) => description = value,
              decoration: InputDecoration(
                labelText: 'Description',

              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(taskListProvider.notifier).modifyTask(
                Task(
                  id: task.id,
                  title: title,
                  description: description,
                  isCompleted: task.isCompleted,
                ),
              );
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}
