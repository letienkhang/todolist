import 'package:flutter/material.dart';
import 'package:todolist/data/model/todo_model.dart';
import 'package:todolist/data/todo_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoList = todoStorage.readTodoList();
    return Scaffold(
      body: ListView(
        children: todoList
            .map(
              (e) => Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(e.title),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
