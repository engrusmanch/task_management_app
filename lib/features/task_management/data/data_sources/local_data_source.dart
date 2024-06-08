
import 'package:task_management_app/core/services/local_storage/db_helper.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';

abstract class LocalDataSource {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}

class LocalDataSourceImpl implements LocalDataSource {
  final TaskDbHelper dbHelper;

  LocalDataSourceImpl({required this.dbHelper});

  @override
  Future<List<Task>> getTasks() async {
    return await dbHelper.getTasks();
  }

  @override
  Future<void> addTask(Task task) async {
    await dbHelper.insertTask(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    await dbHelper.updateTask(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    await dbHelper.deleteTask(id);
  }
}