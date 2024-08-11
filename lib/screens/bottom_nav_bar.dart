import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shopliax_assesement/screens/home/home.dart';
import 'package:shopliax_assesement/screens/photo/photo_screen.dart';
import 'package:shopliax_assesement/screens/todo/todo_create_screen.dart';
import 'package:shopliax_assesement/screens/todo/todo_list_screen.dart';
import 'package:shopliax_assesement/themes.dart/colors.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  late PersistentTabController _controller;

  List<Widget> _screens = [];

  final List<PersistentBottomNavBarItem> _navBarsItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: "Home",
      activeColorPrimary: ShopliaxColors.primaryColor,
      inactiveColorPrimary: ShopliaxColors.disabledDarkColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.calendar_month),
      title: "Todo",
      activeColorPrimary: ShopliaxColors.primaryColor,
      inactiveColorPrimary: ShopliaxColors.disabledDarkColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.photo),
      title: "Portfolio",
      activeColorPrimary: ShopliaxColors.primaryColor,
      inactiveColorPrimary: ShopliaxColors.disabledDarkColor,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _screens = [
      HomeScreen(tabController: _controller),
      const TodoListScreen(),
      PhotoScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PersistentTabView(
            context,
            controller: _controller,
            padding: const EdgeInsets.only(top: 5, bottom: 8),
            decoration: const NavBarDecoration(
              border: Border(
                top: BorderSide(color: Colors.white),
              ),
            ),
            screens: _screens,
            items: _navBarsItems,
            stateManagement: true,
            confineToSafeArea: true,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
            navBarStyle: NavBarStyle.style12,
          ),
          Positioned(
            bottom: 50.0,
            left: MediaQuery.of(context).size.width / 2 - 28,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
              backgroundColor: ShopliaxColors.primaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoCreateScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
