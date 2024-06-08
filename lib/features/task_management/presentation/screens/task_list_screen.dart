import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/presentation/widgets/add_dialog.dart';
import 'package:task_management_app/features/task_management/presentation/widgets/delete_dialog.dart';
import 'package:task_management_app/features/task_management/presentation/widgets/edit_dialog.dart';
import '../state/task_provider.dart';

class TaskListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showEditTaskDialog(context, ref, task);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDeleteConfirmationDialog(context, ref, task.id);
                  },
                ),
              ],
            ),
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context, ref);
        },
        child: Icon(Icons.add),
      ),
    );
  }



}

