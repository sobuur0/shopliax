// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoItem on _TodoItem, Store {
  late final _$titleAtom = Atom(name: '_TodoItem.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$startTimeAtom =
      Atom(name: '_TodoItem.startTime', context: context);

  @override
  DateTime get startTime {
    _$startTimeAtom.reportRead();
    return super.startTime;
  }

  @override
  set startTime(DateTime value) {
    _$startTimeAtom.reportWrite(value, super.startTime, () {
      super.startTime = value;
    });
  }

  late final _$endTimeAtom = Atom(name: '_TodoItem.endTime', context: context);

  @override
  DateTime get endTime {
    _$endTimeAtom.reportRead();
    return super.endTime;
  }

  @override
  set endTime(DateTime value) {
    _$endTimeAtom.reportWrite(value, super.endTime, () {
      super.endTime = value;
    });
  }

  late final _$categoryAtom =
      Atom(name: '_TodoItem.category', context: context);

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$isCompletedAtom =
      Atom(name: '_TodoItem.isCompleted', context: context);

  @override
  bool get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_TodoItem.description', context: context);

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

  late final _$_TodoItemActionController =
      ActionController(name: '_TodoItem', context: context);

  @override
  void toggleCompleted() {
    final _$actionInfo = _$_TodoItemActionController.startAction(
        name: '_TodoItem.toggleCompleted');
    try {
      return super.toggleCompleted();
    } finally {
      _$_TodoItemActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
startTime: ${startTime},
endTime: ${endTime},
category: ${category},
isCompleted: ${isCompleted},
description: ${description}
    ''';
  }
}
