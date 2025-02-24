import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_tracker/core/utils/colors.dart';
import 'package:plant_tracker/core/utils/helper_functions.dart';
import 'package:plant_tracker/core/utils/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
          child: Image(
        image: const AssetImage('assets/images/homepage/home_backdrop.png'),
        width: AppHelperFunctions.screenWidth(),
        height: AppHelperFunctions.screenHeight() * 0.50,
        fit: BoxFit.cover,
      )),
      Column(
        children: [
          const SizedBox(
              height:
                  AppSizes.appBarHeight), // Adjust spacing to fit illustration
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: AppHelperFunctions.screenHeight() * 0.50 -
                        AppSizes.appBarHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: AppSizes.spaceBtwSections * 1.5,
                        ),
                        Text(
                          "Hi, Harsh",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("+ Add a Plant"),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.sm, horizontal: AppSizes.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Plants",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Icon(Icons.more_horiz)
                    ],
                  ),
                ),
                SizedBox(
                  height:
                      AppHelperFunctions.screenHeight() * 0.42 - 60, // Bottom half
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.defaultSpace),
                        PlantCard(
                            plantName: "Sunflower",
                            plantAge: "4",
                            plantProgress: 0.38),
                        PlantCard(
                            plantName: "Sunflower",
                            plantAge: "4",
                            plantProgress: 0.48),
                        PlantCard(
                            plantName: "Sunflower",
                            plantAge: "4",
                            plantProgress: 0.38),
                        PlantCard(
                            plantName: "Sunflower",
                            plantAge: "4",
                            plantProgress: 0.38),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ]));
  }
}

class PlantCard extends StatelessWidget {
  const PlantCard(
      {super.key,
      required this.plantName,
      required this.plantAge,
      required this.plantProgress});

  final String plantName;
  final String plantAge;
  final double plantProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.only(
        bottom: AppSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkGrass,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: NetworkImage('https://img.freepik.com/free-photo/growth-autumn-sunflower-leaf-plant-generative-ai_188544-8853.jpg?t=st=1740395906~exp=1740399506~hmac=3b10faea414cbe154be35715eb03c341b79e462371ff6e308ea53e521c7a118f&w=1800'),
                  width: 50, // Set width if needed
                  height: 50, // Set height if needed
                  fit: BoxFit.cover, // Adjust how the image fits
                  
                ),
              ),
              SizedBox(width: AppSizes.sm * 1.2,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plantName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.white)),
                  Text('${plantAge} weeks old',
                      style: TextStyle(color: AppColors.white.withOpacity(0.8))),
                ],
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 45, // Set fixed width for the progress indicator
                height: 45, // Set fixed height for the progress indicator
                child: CircularProgressIndicator(
                  value: plantProgress, // Progress value (0.0 to 1.0)
                  backgroundColor: Color(0xFF5C755A),
                  color: Color(0xFF9AcA7A),
                  strokeWidth: 5, // Thickness of progress bar
                ),
              ),
              // Percentage Text
              Text(
                '${(plantProgress * 100).toInt()}%', // Convert progress to percentage
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white // Adjust color for visibility
                ),
              ),
            ],
          ), // Dummy progress
        ],
      ),
    );
  }
}
