import 'package:uuid/uuid.dart';

class TodoItem {
  String id;      // Unique identifier for each todo
  String title;   // Description of the todo
  bool isCompleted; // Status of the todo

  TodoItem({
    required this.title,
    this.isCompleted = false,  // Default to not completed
  }) : id = Uuid().v4();  // Generate a unique ID
}