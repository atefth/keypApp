import 'package:flutter/material.dart';
import 'package:keyp_app/src/settings/settings_view.dart';
import 'package:keyp_app/src/todos/todo.dart';
import 'package:keyp_app/src/todos/todo_view.dart';

class TodosView extends StatelessWidget {
  const TodosView({super.key, required this.todos});

  static const routeName = '/todos';

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Today's Todos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'todosListView',
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todos[index];

          return ListTile(
              title: Text('Todo ${todo.id}'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, TodoView.routeName,
                    arguments: todo.toJson());
              });
        },
      ),
    );
  }
}
