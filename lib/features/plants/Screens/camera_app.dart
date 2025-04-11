import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_tracker/features/plants/Screens/disease_summary.dart';
import '../../../plant_disease_model.dart'; // Import your model class

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  String? _error;
  final ImagePicker _picker = ImagePicker();
  String? _modelPrediction = '';
  bool _isProcessing = false;
  PlantDiseaseModel _model = PlantDiseaseModel();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras!.isNotEmpty) {
        _controller = CameraController(_cameras![0], ResolutionPreset.high);
        await _controller!.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      } else {
        setState(() {
          _error = "No cameras available";
        });
      }
    } catch (e) {
      setState(() {
        _error = "Error initializing camera: $e";
      });
    }
  }

  Future<void> _loadModel() async {
    try {
      await _model.loadModel();
    } catch (e) {
      print("Error loading model: $e");
      setState(() {
        _error = "Failed to load model.";
      });
    }
  }

  Future<void> _predictImage(String imagePath) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      int predictedIndex = await _model.predict(File(imagePath));
      setState(() {
        _modelPrediction = _model.classNames[predictedIndex];
      });

      // FIXED: Pass correct named parameter
      Get.to(() => PlantDiseaseSummaryPage(
        modelClassName: _modelPrediction!,
      ));
    } catch (e) {
      print("Error during prediction: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Prediction error: $e')),
      );
    } finally {
      _isProcessing = false;
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) return;
    try {
      final XFile imageFile = await _controller!.takePicture();
      await _predictImage(imageFile.path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error taking picture: $e')),
      );
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        await _predictImage(image.path);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _error != null
          ? Center(child: Text(_error!, style: TextStyle(color: Colors.red)))
          : _isCameraInitialized
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: CameraPreview(_controller!),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: _pickImageFromGallery,
                              child: Icon(Icons.photo_library),
                            ),
                            FloatingActionButton(
                              onPressed: _takePicture,
                              child: Icon(Icons.camera),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
