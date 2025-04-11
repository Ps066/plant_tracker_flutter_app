import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data'; // Import for Float32List
import 'dart:io';

class PlantDiseaseModel {
  late Interpreter interpreter;
  List<String> classNames = [
    'Apple___Apple_scab',
    'Apple___Black_rot',
    'Apple___Cedar_apple_rust',
    'Apple___healthy',
    'Blueberry___healthy',
    'Cherry_(including_sour)___Powdery_mildew',
    'Cherry_(including_sour)___healthy',
    'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot',
    'Corn_(maize)___Common_rust_',
    'Corn_(maize)___Northern_Leaf_Blight',
    'Corn_(maize)___healthy',
    'Grape___Black_rot',
    'Grape___Esca_(Black_Measles)',
    'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)',
    'Grape___healthy',
    'Orange___Haunglongbing_(Citrus_greening)',
    'Peach___Bacterial_spot',
    'Peach___healthy',
    'Pepper,_bell___Bacterial_spot',
    'Pepper,_bell___healthy',
    'Potato___Early_blight',
    'Potato___Late_blight',
    'Potato___healthy',
    'Raspberry___healthy',
    'Soybean___healthy',
    'Squash___Powdery_mildew',
    'Strawberry___Leaf_scorch',
    'Strawberry___healthy',
    'Tomato___Bacterial_spot',
    'Tomato___Early_blight',
    'Tomato___Late_blight',
    'Tomato___Leaf_Mold',
    'Tomato___Septoria_leaf_spot',
    'Tomato___Spider_mites Two-spotted_spider_mite',
    'Tomato___Target_Spot',
    'Tomato___Tomato_Yellow_Leaf_Curl_Virus',
    'Tomato___Tomato_mosaic_virus',
    'Tomato___healthy'
  ];

  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset('assets/plant_disease_model.tflite');
  }

  Future<int> predict(File imageFile) async {
    // Load image and resize
    img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
    img.Image resized = img.copyResize(image!, width: 128, height: 128); // Ensure this matches your model's input size

    // Convert image to Float32List
    Float32List input = Float32List(1 * 128 * 128 * 3); // 1 for batch size
    for (int y = 0; y < 128; y++) {
      for (int x = 0; x < 128; x++) {
        var pixel = resized.getPixel(x, y);
        input[(y * 128 + x) * 3 + 0] = img.getRed(pixel) / 255.0;   // Red
        input[(y * 128 + x) * 3 + 1] = img.getGreen(pixel) / 255.0; // Green
        input[(y * 128 + x) * 3 + 2] = img.getBlue(pixel) / 255.0;  // Blue
      }
    }

    // Prepare output tensor
    var outputTensor = List.filled(classNames.length, 0.0).reshape([1, classNames.length]);

    // Run inference
    interpreter.run(input.reshape([1, 128, 128, 3]), outputTensor); // Reshape input to [1, 128, 128, 3]

    // Get the index of the class with the highest probability
    int resultIndex = outputTensor[0].indexOf(outputTensor[0].reduce((double a, double b) => a > b ? a : b));
    
    return resultIndex; // Return the index of the predicted class
  }
}