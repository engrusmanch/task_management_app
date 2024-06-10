import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/presentation/state/task_providers.dart';
import 'package:task_management_app/features/task_management/presentation/widgets/add_dialog.dart';
import 'package:task_management_app/features/task_management/presentation/widgets/delete_dialog.dart';
import 'package:task_management_app/features/task_management/presentation/widgets/edit_dialog.dart';
import '../state/task_provider.dart';

// Widget for displaying the list of tasks
class TaskListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtain the list of tasks from the taskListProvider
    final taskList = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          final task = taskList[index];
          return ListTile(
            // Display task title and description
            title: Text(task.title),
            subtitle: Text(task.description),
            // Trailing section with edit and delete buttons
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Edit button
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Show edit dialog when edit button is pressed
                    showEditTaskDialog(context, ref, task);
                  },
                ),
                // Delete button
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Show delete confirmation dialog when delete button is pressed
                    showDeleteConfirmationDialog(context, ref, task.id);
                  },
                ),
              ],
            ),
            // Leading section with checkbox for task completion status
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                // Modify task completion status when checkbox value changes
                ref.read(taskListProvider.notifier).modifyTask(
                  Task(
                    id: task.id,
                    title: task.title,
                    description: task.description,
                    isCompleted: value!,
                  ),
                );
              },
            ),
          );
        },
      ),
      // Floating action button for adding a new task
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show add task dialog when floating action button is pressed
          showAddTaskDialog(context, ref);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
