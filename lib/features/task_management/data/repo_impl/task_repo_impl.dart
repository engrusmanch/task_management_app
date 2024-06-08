import 'package:task_management_app/features/task_management/data/data_sources/local_data_source.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/domain/repo/task_repo.dart';
import 'package:uuid/uuid.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;
  final Uuid uuid;

  TaskRepositoryImpl({required this.localDataSource, required this.uuid});

  @override
  Future<void> addTask(Task task) async {

    await localDataSource.addTask(task);
  }
  @override
  Future<void> deleteTask(String id) async {
    await localDataSource.deleteTask(id);
  }

  @override
  Future<List<Task>> getTasks() async {
    return await localDataSource.getTasks();
  }

  @override
  Future<void> updateTask(Task task) async {
    await localDataSource.updateTask(task);
  }
}