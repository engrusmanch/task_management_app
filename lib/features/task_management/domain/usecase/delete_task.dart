
import 'package:task_management_app/features/task_management/domain/repo/task_repo.dart';

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  Future<void> call(String id) async {
    await repository.deleteTask(id);
  }
}
