import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_tracker/core/theme/theme.dart';
import 'package:plant_tracker/navigation_menu.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      home: const NavigationMenu(),
    );
  }
}

