import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopliax_assesement/stores/todo/todo_store.dart';
import 'package:shopliax_assesement/themes.dart/colors.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final todoStore = Provider.of<TodoStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ShopliaxColors.textsColor,
              ),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: size.height * 0.85,
                  child: todoStore.todos.isEmpty
                      ? Center(
                          child: Text(
                            'No todos yet!',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: ShopliaxColors.textsColor,
                                ),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          itemCount: todoStore.todos.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 12);
                          },
                          itemBuilder: (context, index) {
                            final todo = todoStore.todos[index];
                            return Dismissible(
                              key: Key(todo.id),
                              onDismissed: (direction) {
                                todoStore.removeTodo(todo);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('${todo.title} deleted')),
                                );
                              },
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                child: const Icon(Icons.delete,
                                    color: Colors.white),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                margin: index == todoStore.todos.length - 1
                                    ? const EdgeInsets.only(bottom: 12)
                                    : null,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: ShopliaxColors.primaryLightColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset(
                                        'assets/images/${todo.category.toLowerCase()}.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          todo.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                color:
                                                    ShopliaxColors.textsColor,
                                              ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${DateFormat('hh:mm a').format(todo.startTime)} - ${DateFormat('hh:mm a').format(todo.endTime)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color:
                                                    ShopliaxColors.borderColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Observer(
                                      builder: (_) => Checkbox(
                                        value: todo.isCompleted,
                                        onChanged: (value) {
                                          todoStore.toggleTodoCompletion(todo);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
