import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/domain/repo/task_repo.dart';

// Use case class for fetching all tasks
class GetTasks {
  final TaskRepository repository; // Task repository dependency

  // Constructor to initialize the use case with a task repository
  GetTasks(this.repository);

  // Method to execute the use case, fetching all tasks
  Future<List<Task>> call() async {
    // Call the getTasks method of the repository to fetch all tasks
    return await repository.getTasks();
  }
}
