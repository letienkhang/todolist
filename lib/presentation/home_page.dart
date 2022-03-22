import 'package:flutter/material.dart';
import 'package:todolist/business/todo_bloc.dart';
import 'package:todolist/data/model/todo_model.dart';
import 'package:todolist/data/todo_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Todo>>(
                  future: todoStorage.readTodoList(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      final todoList = snapshot.data!;
                      return ListView(
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
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something went wrong"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: FloatingActionButton(
                  onPressed: (){
                    todoBloc.addTodo();
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
