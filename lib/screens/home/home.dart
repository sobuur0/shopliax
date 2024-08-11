import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopliax_assesement/models/todo/todo_item.dart';
import 'package:shopliax_assesement/stores/todo/todo_store.dart';
import 'package:shopliax_assesement/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  final PersistentTabController? tabController;

  const HomeScreen({super.key, this.tabController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoStore>(context, listen: false).loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final todoStore = Provider.of<TodoStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        leading: Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(left: 30, bottom: 8, top: 8),
          decoration: BoxDecoration(
            color: ShopliaxColors.disabledColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.menu,
            color: ShopliaxColors.disabledDarkColor,
          ),
        ),
        title: Text(
          'Homepage',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ShopliaxColors.textsColor,
              ),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.all(9),
            margin:
                const EdgeInsets.only(left: 30, bottom: 8, top: 8, right: 30),
            decoration: BoxDecoration(
              color: ShopliaxColors.disabledColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.notifications,
              color: ShopliaxColors.disabledDarkColor,
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildProgressSummary(context, todoStore),

                const SizedBox(height: 30),

                // Today's Task section
                _buildTaskSection(
                    context, 'Today\'s Tasks', todoStore.todaysTasks, size,
                    isToday: true),
                const SizedBox(height: 30),

                // Overdue Tasks section
                _buildTaskSection(
                    context, 'Overdue Tasks', todoStore.overdueTasks, size),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressSummary(BuildContext context, TodoStore todoStore) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            ShopliaxColors.primaryColor,
            Color(0xff2059A3),
            Color(0xff0E3C73),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Today\'s progress summary',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 12),
          Observer(
            builder: (_) => Text(
              '${todoStore.todaysTasksCount} Tasks',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Observer(
                      builder: (_) => Text(
                        '${(todoStore.todaysTasksCompletionPercentage * 100).toStringAsFixed(0)}%',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Observer(
                  builder: (_) => LinearProgressIndicator(
                    minHeight: 8,
                    backgroundColor: ShopliaxColors.borderColor,
                    color: Colors.white,
                    value: todoStore.todaysTasksCompletionPercentage,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskSection(
    BuildContext context,
    String title,
    List<TodoItem> tasks,
    Size size, {
    bool isToday = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ShopliaxColors.textsColor,
                    ),
              ),
              if (isToday)
                InkWell(
                  onTap: () {
                    widget.tabController!.jumpToTab(1);
                  },
                  child: Text(
                    'See All',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ShopliaxColors.borderColor,
                        ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: size.height * 0.3,
          child: tasks.isEmpty
              ? Center(
                  child: Text(
                    'No ${title.toLowerCase()}!',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: ShopliaxColors.textsColor,
                        ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) =>
                      _buildTaskItem(context, tasks[index]),
                ),
        ),
      ],
    );
  }

  Widget _buildTaskItem(BuildContext context, TodoItem todo) {
    final todoStore = Provider.of<TodoStore>(context, listen: false);

    return Dismissible(
      key: Key(todo.id),
      onDismissed: (direction) {
        todoStore.removeTodo(todo);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${todo.title} deleted')),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: ShopliaxColors.textsColor,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${DateFormat('hh:mm a').format(todo.startTime)} - ${DateFormat('hh:mm a').format(todo.endTime)}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ShopliaxColors.borderColor,
                        ),
                  ),
                ],
              ),
            ),
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
  }
}
