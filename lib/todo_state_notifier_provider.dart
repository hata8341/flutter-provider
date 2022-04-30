import 'package:flutter_provider/entities/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier()
      : super(const [
          Todo(id: '1', title: 'Buy a coffee'),
          Todo(id: '2', title: 'Buy a milk'),
          Todo(id: '3', title: 'Eat sushi'),
          Todo(id: '4', title: 'Build an sushi'),
          Todo(id: '5', title: 'Build my app'),
        ]);

  void add(Todo todo) {
    state = [...state, todo];
  }

  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}
