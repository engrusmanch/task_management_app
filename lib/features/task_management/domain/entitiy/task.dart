class Task {
  final String id; // Unique identifier for the task
  final String title; // Title of the task
  final String description; // Description of the task
  final bool isCompleted; // Flag indicating whether the task is completed or not

  // Constructor to initialize a Task object
  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false, // Default value for isCompleted is false
  });

  // Method to convert a Task object to a Map representation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0, // Convert boolean value to 0 or 1 for storage
    };
  }

  // Factory method to create a Task object from a Map representation
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1, // Convert 0 or 1 back to boolean value
    );
  }
}
