import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:plant_tracker/core/utils/colors.dart';
import 'package:plant_tracker/core/utils/sizes.dart';
import 'package:plant_tracker/features/plants/Screens/camera_app.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PlantListScreen(),
    );
  }
}

class PlantListScreen extends StatefulWidget {
  const PlantListScreen({super.key});

  @override
  State<PlantListScreen> createState() => _PlantListScreenState();
}

class _PlantListScreenState extends State<PlantListScreen> {
  final GetStorage box = GetStorage();
  List<Map<String, dynamic>> plants = [];

  @override
  void initState() {
    super.initState();
    loadPlants();
  }

  void loadPlants() {
    final storedPlants = box.read<List>('plants') ?? [];
    setState(() {
      plants = storedPlants.cast<Map<String, dynamic>>();
    });
  }

  void addPlant(String name, String age, double progress) {
    final newPlant = {
      'name': name,
      'age': age,
      'progress': progress,
    };
    plants.add(newPlant);
    box.write('plants', plants);
    setState(() {});
  }

  void deletePlant(int index) {
    plants.removeAt(index);
    box.write('plants', plants);
    setState(() {});
  }

  void showAddPlantDialog() {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    double progress = 0.5;

    Get.defaultDialog(
      title: 'Add New Plant',
      content: Column(
        children: [
          TextField(controller: nameController, decoration: InputDecoration(hintText: 'Plant Name')),
          TextField(controller: ageController, decoration: InputDecoration(hintText: 'Plant Age in Weeks')),
          Slider(
            value: progress,
            min: 0.0,
            max: 1.0,
            divisions: 10,
            label: '${(progress * 100).toInt()}%',
            onChanged: (value) {
              setState(() {
                progress = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              addPlant(nameController.text, ageController.text, progress);
              Get.back();
            },
            child: Text('Add Plant'),
          )
        ],
      ),
    );
  }

  void showPlantOptions(String plantName) {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plant: $plantName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                Get.to(CameraPage());
              },
              child: Text('Detect Plant Disease', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.red,
              ),
              onPressed: () => Get.back(),
              child: Text('Close', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.red,
              ),
              onPressed: ()=>deletePlant,
              child: Text('Delete Plant', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Plants')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return GestureDetector(
            onTap: () => showPlantOptions(plant['name']),
            child: PlantCard(
              plantName: plant['name'],
              plantAge: plant['age'],
              plantProgress: plant['progress'],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddPlantDialog,
        child: const Icon(Icons.add),
      ),
    );
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