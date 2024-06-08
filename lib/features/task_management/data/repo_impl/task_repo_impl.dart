import 'package:task_management_app/features/task_management/data/data_sources/local_data_source.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/domain/repo/task_repo.dart';
import 'package:uuid/uuid.dart';

// Implementation of the TaskRepository interface
class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource; // Instance of the local data source
  final Uuid uuid; // Instance of the UUID generator

  // Constructor to initialize the repository with a local data source and UUID generator
  TaskRepositoryImpl({required this.localDataSource, required this.uuid});

  // Override method to add a new task
  @override
  Future<void> addTask(Task task) async {
    // Call the addTask method of the local data source to add the task
    await localDataSource.addTask(task);
  }

  // Override method to delete a task by its ID
  @override
  Future<void> deleteTask(String id) async {
    // Call the deleteTask method of the local data source to delete the task
    await localDataSource.deleteTask(id);
  }

  // Override method to fetch all tasks
  @override
  Future<List<Task>> getTasks() async {
    // Call the getTasks method of the local data source to fetch all tasks
    return await localDataSource.getTasks();
  }

  // Override method to update an existing task
  @override
  Future<void> updateTask(Task task) async {
    // Call the updateTask method of the local data source to update the task
    await localDataSource.updateTask(task);
  }
}
