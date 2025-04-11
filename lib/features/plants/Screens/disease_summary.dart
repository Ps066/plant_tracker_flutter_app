import 'package:flutter/material.dart';
import 'package:plant_tracker/features/plants/Screens/plant_list.dart';

// Disease Info Model
class DiseaseInfo {
  final String name;
  final String description;
  final String suggestedMedicine;

  DiseaseInfo({
    required this.name,
    required this.description,
    required this.suggestedMedicine,
  });
}

// Disease Info Map
final Map<String, DiseaseInfo> diseaseInfoMap = {
  'Apple___Apple_scab': DiseaseInfo(
    name: "Apple Scab",
    description: "Fungal disease causing dark, scabby lesions on leaves and fruit.",
    suggestedMedicine: "Fungal Cure Powder, Neem Oil Spray",
  ),
  'Apple___Black_rot': DiseaseInfo(
    name: "Apple Black Rot",
    description: "Causes fruit rot and leaf spots; spreads rapidly in moist environments.",
    suggestedMedicine: "Copper Oxychloride, Bordeaux Mixture",
  ),
  'Apple___Cedar_apple_rust': DiseaseInfo(
    name: "Cedar Apple Rust",
    description: "Fungal disease requiring both apple and cedar trees to complete its lifecycle.",
    suggestedMedicine: "Sulphur Dust, Neem Oil Spray",
  ),
  'Apple___healthy': DiseaseInfo(
    name: "Healthy Apple",
    description: "No signs of disease found on the apple plant.",
    suggestedMedicine: "None",
  ),
  'Blueberry___healthy': DiseaseInfo(
    name: "Healthy Blueberry",
    description: "No signs of disease found on the blueberry plant.",
    suggestedMedicine: "None",
  ),
  'Cherry_(including_sour)___Powdery_mildew': DiseaseInfo(
    name: "Powdery Mildew on Cherry",
    description: "Fungal disease creating a white powdery coating on leaves.",
    suggestedMedicine: "Sulphur Dust, Fungal Cure Powder",
  ),
  'Cherry_(including_sour)___healthy': DiseaseInfo(
    name: "Healthy Cherry",
    description: "No signs of disease found on the cherry plant.",
    suggestedMedicine: "None",
  ),
  'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot': DiseaseInfo(
    name: "Gray Leaf Spot",
    description: "Fungal infection producing rectangular lesions on leaves.",
    suggestedMedicine: "Copper Oxychloride, Neem Oil Spray",
  ),
  'Corn_(maize)___Common_rust_': DiseaseInfo(
    name: "Common Rust",
    description: "Rust-colored pustules on corn leaves caused by a fungal pathogen.",
    suggestedMedicine: "Sulphur Dust, Bordeaux Mixture",
  ),
  'Corn_(maize)___Northern_Leaf_Blight': DiseaseInfo(
    name: "Northern Leaf Blight",
    description: "Creates long gray-green lesions that turn tan over time.",
    suggestedMedicine: "Trichoderma Bio-Fungicide",
  ),
  'Corn_(maize)___healthy': DiseaseInfo(
    name: "Healthy Corn",
    description: "No signs of disease found on the corn plant.",
    suggestedMedicine: "None",
  ),
  'Grape___Black_rot': DiseaseInfo(
    name: "Black Rot of Grape",
    description: "Fungal infection causing sunken black lesions on fruit and leaves.",
    suggestedMedicine: "Fungal Cure Powder, Bordeaux Mixture",
  ),
  'Grape___Esca_(Black_Measles)': DiseaseInfo(
    name: "Esca (Black Measles)",
    description: "Causes dark streaks and rotting in grape vines.",
    suggestedMedicine: "Neem Oil Spray, Copper Oxychloride",
  ),
  'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)': DiseaseInfo(
    name: "Leaf Blight (Isariopsis)",
    description: "Spots with concentric rings that affect grape leaves.",
    suggestedMedicine: "Sulphur Dust, Fungal Cure Powder",
  ),
  'Grape___healthy': DiseaseInfo(
    name: "Healthy Grape",
    description: "No signs of disease found on the grape plant.",
    suggestedMedicine: "None",
  ),
  'Orange___Haunglongbing_(Citrus_greening)': DiseaseInfo(
    name: "Citrus Greening (HLB)",
    description: "Bacterial disease leading to yellowing leaves and bitter fruit.",
    suggestedMedicine: "Neem Oil Spray, Garlic-Chili Pest Spray",
  ),
  'Peach___Bacterial_spot': DiseaseInfo(
    name: "Bacterial Spot",
    description: "Small dark spots on leaves and fruit caused by bacteria.",
    suggestedMedicine: "Copper Oxychloride",
  ),
  'Peach___healthy': DiseaseInfo(
    name: "Healthy Peach",
    description: "No signs of disease found on the peach plant.",
    suggestedMedicine: "None",
  ),
  'Pepper,_bell___Bacterial_spot': DiseaseInfo(
    name: "Bacterial Spot in Bell Pepper",
    description: "Spots on leaves and fruit caused by Xanthomonas bacteria.",
    suggestedMedicine: "Copper Oxychloride, Garlic-Chili Pest Spray",
  ),
  'Pepper,_bell___healthy': DiseaseInfo(
    name: "Healthy Bell Pepper",
    description: "No signs of disease found on the bell pepper plant.",
    suggestedMedicine: "None",
  ),
  'Potato___Early_blight': DiseaseInfo(
    name: "Potato Early Blight",
    description: "Dark concentric leaf spots starting from the lower leaves upward.",
    suggestedMedicine: "Bordeaux Mixture, Fungal Cure Powder",
  ),
  'Potato___Late_blight': DiseaseInfo(
    name: "Potato Late Blight",
    description: "Serious disease causing dark lesions and leaf collapse.",
    suggestedMedicine: "Copper Oxychloride, Trichoderma Bio-Fungicide",
  ),
  'Potato___healthy': DiseaseInfo(
    name: "Healthy Potato",
    description: "No signs of disease found on the potato plant.",
    suggestedMedicine: "None",
  ),
  'Raspberry___healthy': DiseaseInfo(
    name: "Healthy Raspberry",
    description: "No signs of disease found on the raspberry plant.",
    suggestedMedicine: "None",
  ),
  'Soybean___healthy': DiseaseInfo(
    name: "Healthy Soybean",
    description: "No signs of disease found on the soybean plant.",
    suggestedMedicine: "None",
  ),
  'Squash___Powdery_mildew': DiseaseInfo(
    name: "Powdery Mildew on Squash",
    description: "Fungal disease causing white spots on leaves and stems.",
    suggestedMedicine: "Sulphur Dust, Neem Oil Spray",
  ),
  'Strawberry___Leaf_scorch': DiseaseInfo(
    name: "Leaf Scorch on Strawberry",
    description: "Irregular brown lesions on leaves caused by fungi.",
    suggestedMedicine: "Fungal Cure Powder, Trichoderma Bio-Fungicide",
  ),
  'Strawberry___healthy': DiseaseInfo(
    name: "Healthy Strawberry",
    description: "No signs of disease found on the strawberry plant.",
    suggestedMedicine: "None",
  ),
  'Tomato___Bacterial_spot': DiseaseInfo(
    name: "Tomato Bacterial Spot",
    description: "Water-soaked lesions turning into dry spots.",
    suggestedMedicine: "Copper Oxychloride, Garlic-Chili Pest Spray",
  ),
  'Tomato___Early_blight': DiseaseInfo(
    name: "Tomato Early Blight",
    description: "Dark concentric spots on leaves caused by Alternaria fungus.",
    suggestedMedicine: "Fungal Cure Powder, Bordeaux Mixture",
  ),
  'Tomato___Late_blight': DiseaseInfo(
    name: "Tomato Late Blight",
    description: "Brown patches on leaves, stem, and fruit.",
    suggestedMedicine: "Copper Oxychloride, Neem Oil Spray",
  ),
  'Tomato___Leaf_Mold': DiseaseInfo(
    name: "Leaf Mold",
    description: "Yellow spots on upper leaf surface and mold growth underneath.",
    suggestedMedicine: "Trichoderma Bio-Fungicide",
  ),
  'Tomato___Septoria_leaf_spot': DiseaseInfo(
    name: "Septoria Leaf Spot",
    description: "Small circular spots with gray centers on leaves.",
    suggestedMedicine: "Fungal Cure Powder, Bordeaux Mixture",
  ),
  'Tomato___Spider_mites Two-spotted_spider_mite': DiseaseInfo(
    name: "Two-Spotted Spider Mite",
    description: "Tiny pests that create speckled yellow leaves and webs.",
    suggestedMedicine: "Insecticidal Soap, Neem Oil Spray",
  ),
  'Tomato___Target_Spot': DiseaseInfo(
    name: "Target Spot",
    description: "Circular spots with concentric rings on tomato leaves.",
    suggestedMedicine: "Fungal Cure Powder",
  ),
  'Tomato___Tomato_Yellow_Leaf_Curl_Virus': DiseaseInfo(
    name: "Tomato Yellow Leaf Curl Virus",
    description: "Viral disease causing leaf curling and stunted growth.",
    suggestedMedicine: "Azadirachtin 1500ppm, Neem Oil Spray",
  ),
  'Tomato___Tomato_mosaic_virus': DiseaseInfo(
    name: "Tomato Mosaic Virus",
    description: "Mottled yellow-green leaves and malformed fruits.",
    suggestedMedicine: "Azadirachtin 1500ppm",
  ),
  'Tomato___healthy': DiseaseInfo(
    name: "Healthy Tomato",
    description: "No signs of disease found on the tomato plant.",
    suggestedMedicine: "None",
  ),
};
class PlantDiseaseSummaryPage extends StatelessWidget {
  final String modelClassName;

  const PlantDiseaseSummaryPage({
    Key? key,
    required this.modelClassName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diseaseInfo = diseaseInfoMap[modelClassName];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Disease Summary'),
        backgroundColor: Colors.green[700],
        leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PlantListScreen()), // Replace with your actual Home widget
      );
    },
  ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: diseaseInfo == null
            ? const Center(child: Text("Disease information not found."))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diseaseInfo.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    diseaseInfo.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Suggested Medicine:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    diseaseInfo.suggestedMedicine,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
      ),
    );
  }
}
