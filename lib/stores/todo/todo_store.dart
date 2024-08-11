import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopliax_assesement/models/todo/todo_item.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  ObservableList<String> categories =
      ObservableList.of(['Design', 'Development', 'Research']);

  @observable
  String selectedCategory = 'Design';

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  TimeOfDay startTime = TimeOfDay.now();

  @observable
  TimeOfDay endTime = TimeOfDay(
      hour: (TimeOfDay.now().hour + 2) % 24, minute: TimeOfDay.now().minute);

  @observable
  ObservableList<TodoItem> todos = ObservableList<TodoItem>();

  @observable
  String taskName = '';

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get isFormValid =>
      taskName.isNotEmpty &&
      selectedCategory.isNotEmpty &&
      description.isNotEmpty;

  @action
  void setTaskName(String value) => taskName = value;

  @action
  Future<void> addTodo(TodoItem todo) async {
    todos.add(todo);
    await _saveTodos();
  }

  @action
  Future<void> removeTodo(TodoItem todo) async {
    todos.remove(todo);
    await _saveTodos();
  }

  @action
  Future<void> toggleTodoCompletion(TodoItem todo) async {
    todo.toggleCompleted();
    await _saveTodos();
  }

  @action
  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosJson = prefs.getString('todos');
    if (todosJson != null) {
      final List<dynamic> decodedTodos = json.decode(todosJson);
      todos = ObservableList.of(
        decodedTodos.map((todo) => TodoItemJson.fromJson(todo)).toList(),
      );
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedTodos =
        json.encode(todos.map((todo) => todo.toJson()).toList());
    await prefs.setString('todos', encodedTodos);
  }

  @action
  Future<void> createTodo() async {
    final now = DateTime.now();
    final startDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      startTime.hour,
      startTime.minute,
    );

    final endDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      endTime.hour,
      endTime.minute,
    );

    final adjustedEndDateTime = endDateTime.isBefore(startDateTime)
        ? endDateTime.add(const Duration(days: 1))
        : endDateTime;

    final newTodo = TodoItem(
      id: now.millisecondsSinceEpoch.toString(),
      title: taskName,
      startTime: startDateTime,
      endTime: adjustedEndDateTime,
      category: selectedCategory,
      description: description,
    );

    await addTodo(newTodo);
    resetForm();
  }

  @action
  void resetForm() {
    taskName = '';
    description = '';
    selectedCategory = categories.first;
    selectedDate = DateTime.now();
    startTime = TimeOfDay.now();
    endTime = TimeOfDay(
        hour: (TimeOfDay.now().hour + 2) % 24, minute: TimeOfDay.now().minute);
  }

  @computed
  List<TodoItem> get todaysTasks {
    final now = DateTime.now();
    return todos.where((todo) {
      return todo.startTime.year == now.year &&
          todo.startTime.month == now.month &&
          todo.startTime.day == now.day;
    }).toList();
  }

  @computed
  int get todaysTasksCount => todaysTasks.length;

  @computed
  int get completedTodaysTasksCount =>
      todaysTasks.where((task) => task.isCompleted).length;

  @computed
  double get todaysTasksCompletionPercentage {
    if (todaysTasksCount == 0) return 0.0;
    return completedTodaysTasksCount / todaysTasksCount;
  }

  @computed
  List<TodoItem> get overdueTasks {
    final now = DateTime.now();
    return todos
        .where((todo) =>
            !todo.isCompleted &&
            todo.endTime.isBefore(DateTime(now.year, now.month, now.day)))
        .toList();
  }

  @computed
  int get overdueTasksCount => overdueTasks.length;
}
