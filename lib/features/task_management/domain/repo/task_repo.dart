import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';

// Abstract class defining the contract for a task repository
abstract class TaskRepository {
  // Method to fetch all tasks
  Future<List<Task>> getTasks();

  // Method to add a new task
  Future<void> addTask(Task task);

  // Method to update an existing task
  Future<void> updateTask(Task task);

  // Method to delete a task by its ID
  Future<void> deleteTask(String id);
}
