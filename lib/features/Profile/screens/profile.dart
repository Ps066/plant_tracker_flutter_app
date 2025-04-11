import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:plant_tracker/core/utils/helper_functions.dart';
import 'package:plant_tracker/core/utils/sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(LineAwesomeIcons.angle_left_solid),
        ),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: AppSizes.spaceBtwItems,),
              SizedBox(
                height: AppHelperFunctions.screenWidth() * 0.45,
                width: AppHelperFunctions.screenWidth() * 0.45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: NetworkImage(
                        "https://www.pricechopper.com/wp-content/uploads/2023/08/Sunflowers-scaled.jpg"),
                        height: AppHelperFunctions.screenWidth() * 0.45,
                        width: AppHelperFunctions.screenWidth() * 0.45,
                        fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections,),
              Text("Harsh", style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: AppSizes.spaceBtwItems /2,),
              Text("harsh@gmail.com", style: Theme.of(context).textTheme.titleLarge,),

            ],
          ),
        ),
      ),
    );
  }
}
