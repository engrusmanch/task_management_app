import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/domain/repo/task_repo.dart';

// Use case class for updating a task
class UpdateTask {
  final TaskRepository repository; // Task repository dependency

  // Constructor to initialize the use case with a task repository
  UpdateTask(this.repository);

  // Method to execute the use case, updating a task
  Future<void> call(Task task) async {
    // Call the updateTask method of the repository to update the task
    await repository.updateTask(task);
  }
}
