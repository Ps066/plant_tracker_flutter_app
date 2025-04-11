import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plant_tracker/app.dart';
import 'plant_disease_model.dart';

PlantDiseaseModel model = PlantDiseaseModel();

Future<void> main() async {
  await GetStorage.init();
  model.loadModel();
  runApp(const App());
}

