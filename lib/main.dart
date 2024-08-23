import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TextRecognitionPage(),
    );
  }
}

class TextRecognitionPage extends StatefulWidget {
  @override
  _TextRecognitionPageState createState() => _TextRecognitionPageState();
}

class _TextRecognitionPageState extends State<TextRecognitionPage> {
  final ImagePicker _picker = ImagePicker();
  String _recognizedText = '';
  bool _isLoading = false;
  XFile? _selectedImage;

  Future<void> _recognizeText() async {
    setState(() {
      _isLoading = true;
    });

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _selectedImage = image;
      final InputImage inputImage = InputImage.fromFilePath(image.path);
      final TextRecognizer textRecognizer = GoogleMlKit.vision.textRecognizer();
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      setState(() {
        _recognizedText = recognizedText.text;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PicText'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.grey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_selectedImage != null)
              Image.file(
                File(_selectedImage!.path),
                height: screenSize.height * 0.3, // 30% of screen height
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            const SizedBox(height: 16),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.grey,
                  ))
                : _recognizedText.isNotEmpty
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            padding: EdgeInsets.all(screenSize.width * 0.04),
                            child: SelectableText.rich(
                              TextSpan(
                                text: _recognizedText,
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.045,
                                  color: Colors.black87,
                                  height: 1.5, // Adjust the line height
                                ),
                              ),
                              textAlign: TextAlign.left,
                              showCursor: true,
                              cursorColor: Colors.grey,
                              cursorWidth: 2.0,
                              toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          'No text recognized yet. Please pick an image.',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.05,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _recognizeText,
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
