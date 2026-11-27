
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    ),
  );
}

// Todo Model
class Todo {
  final String title;
  bool done;

  Todo(this.title, {this.done = false});
}

// Main Todo Page
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() {
    return _TodoPageState();
  }
}

class _TodoPageState extends State<TodoPage> {

  // List to store tasks
  final List<Todo> todos = [];

  // Controller for text input
  final TextEditingController controller =
      TextEditingController();

  // Function to add a task
  void add() {
    final text = controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      todos.add(Todo(text));
    });

    controller.clear();
  }

  // Release controller resources
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Count incomplete tasks
    final remaining =
        todos.where((t) => !t.done).length;

    return Scaffold(

      // App Bar
      appBar: AppBar(
        title: Text("To-Do ($remaining left)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [

          // Task Input Section
          Padding(
            padding: const EdgeInsets.all(12),

            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,

                    decoration: const InputDecoration(
                      hintText: "Enter a new task",
                      border: OutlineInputBorder(),
                    ),

                    onSubmitted: (_) => add(),
                  ),
                ),

                IconButton(
                  onPressed: add,
                  icon: const Icon(Icons.add),
                  color: Colors.indigo,
                ),

              ],
            ),
          ),

          // Task List
          Expanded(
            child: todos.isEmpty

                // Empty State
                ? const Center(
                    child: Text(
                      "Nothing to do. Add a task!",
                      style: TextStyle(fontSize: 18),
                    ),
                  )

                // Display Tasks
                : ListView.builder(
                    itemCount: todos.length,

                    itemBuilder: (context, i) {

                      final todo = todos[i];

                      return Dismissible(

                        key: ObjectKey(todo),

                        // Delete task when swiped
                        onDismissed: (_) {
                          setState(() {
                            todos.remove(todo);
                          });
                        },

                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),

                        // Checkbox for task completion
                        child: CheckboxListTile(

                          title: Text(
                            todo.title,

                            style: TextStyle(
                              decoration: todo.done
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),

                          value: todo.done,

                          onChanged: (value) {
                            setState(() {
                              todo.done = value ?? false;
                            });
                          },
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
