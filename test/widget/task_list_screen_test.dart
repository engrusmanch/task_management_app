import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management_app/features/task_management/presentation/screens/task_list_screen.dart';

void main() {
  group('Task List Screen Widget Tests', () {
    testWidgets('Task List Screen UI Test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(home: TaskListScreen()));

      // Verify that our app contains an app bar with the given title.
      expect(find.text('Task Management'), findsOneWidget);

      // Verify that our app contains a floating action button.
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    // Add more widget tests as needed for other UI components
  });
}
