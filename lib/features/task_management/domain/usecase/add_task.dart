import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/domain/repo/task_repo.dart';
import 'package:uuid/uuid.dart';

// Use case class for adding a new task
class AddTask {
  final TaskRepository repository; // Task repository dependency

  // Constructor to initialize the use case with a task repository
  AddTask(this.repository);

  // Method to execute the use case, adding a new task
  Future<void> call(String title, String description) async {
    // Generate a unique ID for the new task using UUID
    final taskId = Uuid().v4();

    // Create a new task object with the provided title, description, and generated ID
    final task = Task(id: taskId, title: title, description: description);

    // Call the addTask method of the repository to add the new task
    await repository.addTask(task);
  }
}
