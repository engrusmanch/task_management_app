import 'package:riverpod/riverpod.dart';
import 'package:task_management_app/core/services/local_storage/db_helper.dart';
import 'package:task_management_app/features/task_management/data/data_sources/local_data_source.dart';
import 'package:task_management_app/features/task_management/data/repo_impl/task_repo_impl.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/domain/repo/task_repo.dart';
import 'package:task_management_app/features/task_management/domain/usecase/add_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/delete_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/get_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/update_task.dart';
import 'package:uuid/uuid.dart';

// Providers

/// Provider for the TaskRepository.
/// It provides an instance of TaskRepositoryImpl,
/// which interacts with the local database.
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final localDataSource = LocalDataSourceImpl(dbHelper: TaskDbHelper());
  return TaskRepositoryImpl(localDataSource: localDataSource, uuid: Uuid());
});


/// Provider for the GetTasks use case.
/// It provides an instance of GetTasks, which retrieves tasks from the repository.
final getTasksProvider = Provider<GetTasks>((ref) {
  return GetTasks(ref.watch(taskRepositoryProvider));
});

/// Provider for the AddTask use case.
/// It provides an instance of AddTask, which adds a new task to the repository.
final addTaskProvider = Provider<AddTask>((ref) {
  return AddTask(ref.watch(taskRepositoryProvider));
});

/// Provider for the UpdateTask use case.
/// It provides an instance of UpdateTask, which updates an existing task in the repository.
final updateTaskProvider = Provider<UpdateTask>((ref) {
  return UpdateTask(ref.watch(taskRepositoryProvider));
});

/// Provider for the DeleteTask use case.
/// It provides an instance of DeleteTask, which deletes a task from the repository.
final deleteTaskProvider = Provider<DeleteTask>((ref) {
  return DeleteTask(ref.watch(taskRepositoryProvider));
});

/// Provider for managing the state of the task list.
/// It provides a TaskListNotifier, which is a StateNotifier<List<Task>>.
final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>((ref) {
  return TaskListNotifier(
    getTasks: ref.watch(getTasksProvider),
    addTask: ref.watch(addTaskProvider),
    updateTask: ref.watch(updateTaskProvider),
    deleteTask: ref.watch(deleteTaskProvider),
  );
});

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
