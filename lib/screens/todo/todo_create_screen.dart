import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopliax_assesement/screens/bottom_nav_bar.dart';
import 'package:shopliax_assesement/stores/todo/todo_store.dart';
import 'package:shopliax_assesement/themes.dart/colors.dart';

class TodoCreateScreen extends StatelessWidget {
  const TodoCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoStore = Provider.of<TodoStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        toolbarHeight: 50,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(left: 35, bottom: 8, top: 8),
            decoration: BoxDecoration(
              color: ShopliaxColors.disabledColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.chevron_left,
              color: ShopliaxColors.disabledDarkColor,
            ),
          ),
        ),
        title: Text(
          'Create new Task',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ShopliaxColors.textsColor,
              ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Task Name',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ShopliaxColors.textsColor,
                    ),
              ),
              const SizedBox(height: 14),
              Observer(
                builder: (_) => TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ShopliaxColors.textsColor,
                      ),
                  decoration: const InputDecoration(
                    hintText: 'UI design',
                  ),
                  onChanged: todoStore.setTaskName,
                  // controller: TextEditingController(text: todoStore.taskName),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Category',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ShopliaxColors.textsColor,
                    ),
              ),
              const SizedBox(height: 14),
              Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: todoStore.categories
                      .map(
                        (category) => GestureDetector(
                          onTap: () {
                            runInAction(
                                () => todoStore.selectedCategory = category);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 8),
                            decoration: BoxDecoration(
                              color: todoStore.selectedCategory == category
                                  ? ShopliaxColors.primaryColor
                                  : ShopliaxColors.primaryLightColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              category,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        todoStore.selectedCategory == category
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Date & Time',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ShopliaxColors.textsColor,
                    ),
              ),
              const SizedBox(height: 14),
              Observer(
                builder: (_) => GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: todoStore.selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != todoStore.selectedDate) {
                      runInAction(() => todoStore.selectedDate = picked);
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: TextEditingController(
                        text: DateFormat('dd MMMM, EEEE')
                            .format(todoStore.selectedDate),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ShopliaxColors.textsColor,
                          ),
                      decoration: const InputDecoration(
                        hintText: 'Select date',
                        suffixIcon: Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start time',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: ShopliaxColors.textsColor,
                              ),
                        ),
                        const SizedBox(height: 14),
                        Observer(
                          builder: (_) => GestureDetector(
                            onTap: () async {
                              final TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: todoStore.startTime,
                              );
                              if (picked != null &&
                                  picked != todoStore.startTime) {
                                runInAction(() => todoStore.startTime = picked);
                              }
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: TextEditingController(
                                  text: todoStore.startTime.format(context),
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: ShopliaxColors.textsColor,
                                    ),
                                decoration: const InputDecoration(
                                  hintText: 'Select start time',
                                  suffixIcon:
                                      Icon(Icons.keyboard_arrow_down_sharp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End time',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: ShopliaxColors.textsColor,
                              ),
                        ),
                        const SizedBox(height: 14),
                        Observer(
                          builder: (_) => GestureDetector(
                            onTap: () async {
                              final TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: todoStore.endTime,
                              );
                              if (picked != null &&
                                  picked != todoStore.endTime) {
                                runInAction(() => todoStore.endTime = picked);
                              }
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: TextEditingController(
                                  text: todoStore.endTime.format(context),
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: ShopliaxColors.textsColor,
                                    ),
                                decoration: const InputDecoration(
                                  hintText: 'Select end time',
                                  suffixIcon:
                                      Icon(Icons.keyboard_arrow_down_sharp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                'Description',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ShopliaxColors.textsColor,
                    ),
              ),
              const SizedBox(height: 14),
              Observer(
                builder: (_) => TextFormField(
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ShopliaxColors.textsColor,
                      ),
                  decoration: const InputDecoration(
                    hintText:
                        'Research design paths. There are many\ncareer paths within field of design...',
                  ),
                  onChanged: todoStore.setDescription,
                  // controller:
                  //     TextEditingController(text: todoStore.description),
                ),
              ),
              const SizedBox(height: 25),
              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: todoStore.isFormValid
                      ? () async {
                          await todoStore.createTodo();
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppNavBar(),
                              ),
                            );
                          }
                        }
                      : null,
                  child: const Text('Create Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
