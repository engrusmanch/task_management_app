import 'package:riverpod/riverpod.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/add_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/delete_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/get_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/update_task.dart';



/// StateNotifier that manages the list of tasks.
class TaskListNotifier extends StateNotifier<List<Task>> {
  final GetTasks getTasks;
  final AddTask addTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;

  TaskListNotifier({
    required this.getTasks,
    required this.addTask,
    required this.updateTask,
    required this.deleteTask,
  }) : super([]) {
    // Load tasks from the repository when the notifier is instantiated.
    _loadTasks();
  }

  /// Loads tasks from the repository and updates the state.
  Future<void> _loadTasks() async {
    state = await getTasks();
  }

  /// Adds a new task to the repository and reloads the tasks.
  Future<void> addNewTask(String title, String description) async {
    await addTask(title, description);
    await _loadTasks();
  }

  /// Updates an existing task in the repository and reloads the tasks.
  Future<void> modifyTask(Task task) async {
    await updateTask(task);
    await _loadTasks();
  }

  /// Deletes a task from the repository and reloads the tasks.
  Future<void> removeTask(String id) async {
    await deleteTask(id);
    await _loadTasks();
  }
}
