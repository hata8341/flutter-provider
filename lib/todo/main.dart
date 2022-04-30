import 'package:flutter/material.dart';
import 'package:flutter_provider/entities/todo.dart';
import 'package:flutter_provider/todo/todo_state_notifier_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>(
  (ref) => TodoListNotifier(),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('todoList'),
        ),
        body: const TodoPage(),
      ),
    );
  }
}

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListNotifierProvider);
    final todoListController = ref.read(todoListNotifierProvider.notifier);
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        final todo = todoList[index];
        return ListTile(
            title: Text(todo.title),
            leading: Icon(todo.completed
                ? Icons.check_box
                : Icons.check_box_outline_blank),
            trailing: TextButton(
              onPressed: () => todoListController.remove(todo.id),
              child: const Text('Delete'),
            ),
            onTap: () => todoListController.toggle(todo.id));
      },
    );
  }
}
