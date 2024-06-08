import 'package:task_management_app/features/task_management/domain/repo/task_repo.dart';

// Use case class for deleting a task
class DeleteTask {
  final TaskRepository repository; // Task repository dependency

  // Constructor to initialize the use case with a task repository
  DeleteTask(this.repository);

  // Method to execute the use case, deleting a task by its ID
  Future<void> call(String id) async {
    // Call the deleteTask method of the repository to delete the task by its ID
    await repository.deleteTask(id);
  }
}
