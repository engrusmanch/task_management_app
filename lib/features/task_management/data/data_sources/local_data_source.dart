import 'package:task_management_app/core/services/local_storage/db_helper.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';

// Abstract class defining the contract for a local data source
abstract class LocalDataSource {
  // Method to fetch all tasks from the local storage
  Future<List<Task>> getTasks();

  // Method to add a new task to the local storage
  Future<void> addTask(Task task);

  // Method to update an existing task in the local storage
  Future<void> updateTask(Task task);

  // Method to delete a task from the local storage based on its ID
  Future<void> deleteTask(String id);
}

// Implementation of the LocalDataSource interface
class LocalDataSourceImpl implements LocalDataSource {
  final TaskDbHelper dbHelper; // Instance of the database helper class

  // Constructor to initialize the local data source with a database helper
  LocalDataSourceImpl({required this.dbHelper});

  // Override method to fetch all tasks from the local storage
  @override
  Future<List<Task>> getTasks() async {
    return await dbHelper.getTasks(); // Call the method from the database helper to fetch tasks
  }

  // Override method to add a new task to the local storage
  @override
  Future<void> addTask(Task task) async {
    await dbHelper.insertTask(task); // Call the method from the database helper to insert a task
  }

  // Override method to update an existing task in the local storage
  @override
  Future<void> updateTask(Task task) async {
    await dbHelper.updateTask(task); // Call the method from the database helper to update a task
  }

  // Override method to delete a task from the local storage based on its ID
  @override
  Future<void> deleteTask(String id) async {
    await dbHelper.deleteTask(id); // Call the method from the database helper to delete a task
  }
}
