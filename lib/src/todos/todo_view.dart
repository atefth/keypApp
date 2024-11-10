import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keyp_app/src/todos/todo.dart';

class TodoView extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final ValueNotifier<bool> _isCompleted = ValueNotifier<bool>(false);

  TodoView({super.key});

  static const routeName = '/todo';

  @override
  Widget build(BuildContext context) {
    final Todo todo = Todo.fromJson(
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo ${todo.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: _isCompleted,
                  builder: (context, value, child) {
                    return Checkbox(
                      value: value,
                      onChanged: (bool? newValue) {
                        _isCompleted.value = newValue ?? false;
                      },
                    );
                  },
                ),
                const Text('Completed'),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _noteController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
