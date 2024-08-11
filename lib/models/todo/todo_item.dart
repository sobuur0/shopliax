import 'package:mobx/mobx.dart';

part 'todo_item.g.dart';

class TodoItem = _TodoItem with _$TodoItem;

abstract class _TodoItem with Store {
  _TodoItem({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.category,
    required this.description,
    this.isCompleted = false,
  });

  final String id;

  @observable
  String title;

  @observable
  DateTime startTime;

  @observable
  DateTime endTime;

  @observable
  String category;

  @observable
  bool isCompleted;

  @observable
  String description;

  @action
  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}

extension TodoItemJson on TodoItem {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'category': category,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'],
      title: json['title'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      category: json['category'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }
}
