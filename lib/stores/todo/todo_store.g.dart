// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_TodoStore.isFormValid'))
          .value;
  Computed<List<TodoItem>>? _$todaysTasksComputed;

  @override
  List<TodoItem> get todaysTasks => (_$todaysTasksComputed ??=
          Computed<List<TodoItem>>(() => super.todaysTasks,
              name: '_TodoStore.todaysTasks'))
      .value;
  Computed<int>? _$todaysTasksCountComputed;

  @override
  int get todaysTasksCount => (_$todaysTasksCountComputed ??= Computed<int>(
          () => super.todaysTasksCount,
          name: '_TodoStore.todaysTasksCount'))
      .value;
  Computed<int>? _$completedTodaysTasksCountComputed;

  @override
  int get completedTodaysTasksCount => (_$completedTodaysTasksCountComputed ??=
          Computed<int>(() => super.completedTodaysTasksCount,
              name: '_TodoStore.completedTodaysTasksCount'))
      .value;
  Computed<double>? _$todaysTasksCompletionPercentageComputed;

  @override
  double get todaysTasksCompletionPercentage =>
      (_$todaysTasksCompletionPercentageComputed ??= Computed<double>(
              () => super.todaysTasksCompletionPercentage,
              name: '_TodoStore.todaysTasksCompletionPercentage'))
          .value;
  Computed<List<TodoItem>>? _$overdueTasksComputed;

  @override
  List<TodoItem> get overdueTasks => (_$overdueTasksComputed ??=
          Computed<List<TodoItem>>(() => super.overdueTasks,
              name: '_TodoStore.overdueTasks'))
      .value;
  Computed<int>? _$overdueTasksCountComputed;

  @override
  int get overdueTasksCount => (_$overdueTasksCountComputed ??= Computed<int>(
          () => super.overdueTasksCount,
          name: '_TodoStore.overdueTasksCount'))
      .value;

  late final _$categoriesAtom =
      Atom(name: '_TodoStore.categories', context: context);

  @override
  ObservableList<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_TodoStore.selectedCategory', context: context);

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_TodoStore.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$startTimeAtom =
      Atom(name: '_TodoStore.startTime', context: context);

  @override
  TimeOfDay get startTime {
    _$startTimeAtom.reportRead();
    return super.startTime;
  }

  @override
  set startTime(TimeOfDay value) {
    _$startTimeAtom.reportWrite(value, super.startTime, () {
      super.startTime = value;
    });
  }

  late final _$endTimeAtom = Atom(name: '_TodoStore.endTime', context: context);

  @override
  TimeOfDay get endTime {
    _$endTimeAtom.reportRead();
    return super.endTime;
  }

  @override
  set endTime(TimeOfDay value) {
    _$endTimeAtom.reportWrite(value, super.endTime, () {
      super.endTime = value;
    });
  }

  late final _$todosAtom = Atom(name: '_TodoStore.todos', context: context);

  @override
  ObservableList<TodoItem> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<TodoItem> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$taskNameAtom =
      Atom(name: '_TodoStore.taskName', context: context);

  @override
  String get taskName {
    _$taskNameAtom.reportRead();
    return super.taskName;
  }

  @override
  set taskName(String value) {
    _$taskNameAtom.reportWrite(value, super.taskName, () {
      super.taskName = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_TodoStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$addTodoAsyncAction =
      AsyncAction('_TodoStore.addTodo', context: context);

  @override
  Future<void> addTodo(TodoItem todo) {
    return _$addTodoAsyncAction.run(() => super.addTodo(todo));
  }

  late final _$removeTodoAsyncAction =
      AsyncAction('_TodoStore.removeTodo', context: context);

  @override
  Future<void> removeTodo(TodoItem todo) {
    return _$removeTodoAsyncAction.run(() => super.removeTodo(todo));
  }

  late final _$toggleTodoCompletionAsyncAction =
      AsyncAction('_TodoStore.toggleTodoCompletion', context: context);

  @override
  Future<void> toggleTodoCompletion(TodoItem todo) {
    return _$toggleTodoCompletionAsyncAction
        .run(() => super.toggleTodoCompletion(todo));
  }

  late final _$loadTodosAsyncAction =
      AsyncAction('_TodoStore.loadTodos', context: context);

  @override
  Future<void> loadTodos() {
    return _$loadTodosAsyncAction.run(() => super.loadTodos());
  }

  late final _$createTodoAsyncAction =
      AsyncAction('_TodoStore.createTodo', context: context);

  @override
  Future<void> createTodo() {
    return _$createTodoAsyncAction.run(() => super.createTodo());
  }

  late final _$_TodoStoreActionController =
      ActionController(name: '_TodoStore', context: context);

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaskName(String value) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.setTaskName');
    try {
      return super.setTaskName(value);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetForm() {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.resetForm');
    try {
      return super.resetForm();
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
selectedCategory: ${selectedCategory},
selectedDate: ${selectedDate},
startTime: ${startTime},
endTime: ${endTime},
todos: ${todos},
taskName: ${taskName},
description: ${description},
isFormValid: ${isFormValid},
todaysTasks: ${todaysTasks},
todaysTasksCount: ${todaysTasksCount},
completedTodaysTasksCount: ${completedTodaysTasksCount},
todaysTasksCompletionPercentage: ${todaysTasksCompletionPercentage},
overdueTasks: ${overdueTasks},
overdueTasksCount: ${overdueTasksCount}
    ''';
  }
}
