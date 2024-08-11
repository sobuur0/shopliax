import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopliax_assesement/screens/bottom_nav_bar.dart';
import 'package:shopliax_assesement/stores/photo/photo_store.dart';
import 'package:shopliax_assesement/stores/todo/todo_store.dart';
import 'package:shopliax_assesement/themes.dart/shopliax_theme.dart';

class ShopliaxApp extends StatelessWidget {
  const ShopliaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TodoStore>(create: (_) => TodoStore()),
        Provider<PhotoStore>(create: (_) => PhotoStore()),
      ],
      child: MaterialApp(
        title: 'Shopliax Assesement',
        theme: ShopliaxTheme.light(),
        home: const AppNavBar(),
      ),
    );
  }
}
