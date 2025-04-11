import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_tracker/core/utils/colors.dart';
import 'package:plant_tracker/core/utils/helper_functions.dart';
import 'package:plant_tracker/features/Profile/screens/Profile.dart';
import 'package:plant_tracker/features/home/Screens/home.dart';
import 'package:plant_tracker/features/plants/Screens/camera_app.dart';
import 'package:plant_tracker/features/plants/Screens/plant_list.dart';
import 'package:plant_tracker/features/plants/Screens/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
        height: 60,
          elevation: 5,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value = index,
          backgroundColor: darkMode? AppColors.black : Colors.white,
          indicatorColor: darkMode? AppColors.white.withOpacity(0.1): AppColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Plants'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
      )),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController{
  // variable of current selected screen index
  final RxInt selectedIndex = 0.obs;

  // screens array 
  final screens = [
    const HomePage(),
    ProductGridPage(),
    PlantListScreen(),
    ProfilePage(),
  ];
}