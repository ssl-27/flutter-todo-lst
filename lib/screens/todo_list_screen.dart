// lib/screens/todo_list_screen.dart
import 'package:flutter/material.dart';
import '../models/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoItem> _todoItems = [];
  final TextEditingController _textController = TextEditingController();

  void _addTodoItem() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _todoItems.add(TodoItem(title: _textController.text));
        _textController.clear();
      });
    }
  }

  // Toggle todo completion status
  void _toggleTodoItem(TodoItem item) {
    setState(() {
      item.isCompleted = !item.isCompleted;
    });
  }

  // Delete a todo item
  void _deleteTodoItem(TodoItem item) {
    setState(() {
      _todoItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Input area (same as previous step)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter a new todo item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTodoItem,
                  child: Text('Add'),
                ),
              ],
            ),
          ),

          // Todo list display with interactions
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (context, index) {
                final item = _todoItems[index];
                return ListTile(
                  title: Text(
                    item.title,
                    style: TextStyle(
                      decoration: item.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: item.isCompleted,
                    onChanged: (_) => _toggleTodoItem(item),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTodoItem(item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}