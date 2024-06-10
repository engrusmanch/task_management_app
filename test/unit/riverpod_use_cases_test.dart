import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management_app/features/task_management/data/data_sources/local_data_source.dart';
import 'package:task_management_app/features/task_management/data/repo_impl/task_repo_impl.dart';
import 'package:task_management_app/features/task_management/domain/entitiy/task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/add_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/delete_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/get_task.dart';
import 'package:task_management_app/features/task_management/domain/usecase/update_task.dart';
import 'package:task_management_app/features/task_management/presentation/state/task_%20notifier.dart';
import 'package:uuid/uuid.dart';

// Mock LocalDataSource
class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  group('Task Management Unit Tests', () {
    late MockLocalDataSource mockLocalDataSource;
    late TaskRepositoryImpl taskRepository;
    late GetTasks getTasks;
    late AddTask addTask;
    late UpdateTask updateTask;
    late DeleteTask deleteTask;
    late TaskListNotifier taskListNotifier;

    setUp(() {
      mockLocalDataSource = MockLocalDataSource();
      taskRepository = TaskRepositoryImpl(localDataSource: mockLocalDataSource, uuid: Uuid());
      getTasks = GetTasks(taskRepository);
      addTask = AddTask(taskRepository);
      updateTask = UpdateTask(taskRepository);
      deleteTask = DeleteTask(taskRepository);
      taskListNotifier = TaskListNotifier(
        getTasks: getTasks,
        addTask: addTask,
        updateTask: updateTask,
        deleteTask: deleteTask,
      );
    });

    test('Test Get Tasks Use Case', () async {
      // Mock the return value of getTasks method in LocalDataSource
      final List<Task> mockTasks = [
        Task(id: '1', title: 'Task 1', description: 'Description 1', isCompleted: false),
        Task(id: '2', title: 'Task 2', description: 'Description 2', isCompleted: true),
      ];
      when(mockLocalDataSource.getTasks()).thenAnswer((_) async => mockTasks);

      final tasks = await getTasks();

      expect(tasks, mockTasks);
    });

    // test('Test Add Task Use Case', () async {
    //   final taskToAdd = Task(id: '1', title: 'New Task', description: 'New Description', isCompleted: false);
    //
    //   // Mock Uuid to return a specific ID
    //   when(mockUuid.v4()).thenReturn(taskToAdd.id);
    //
    //   await addTask(taskToAdd);
    //
    //   verify(mockLocalDataSource.addTask(taskToAdd));
    // });

    // Similarly, write tests for UpdateTask and DeleteTask use cases
  });
}
