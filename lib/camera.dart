import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _imageFile;
  ScreenshotController screenshotController = ScreenshotController();


  @override
  void initState() {
    super.initState();
  }

  Future<void> captureAndSaveImage(Uint8List capturedImage) async {
    try {
      final directory = await getExternalStorageDirectory();
      final fileName = 'my_captured_image.png';

      if (directory != null) {
        final filePath = '${directory.path}/$fileName';
        final file = File(filePath);

        await file.writeAsBytes(capturedImage);

        print('Image saved at: $filePath');
      }
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  Future<dynamic> ShowCapturedWidget(BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Image Downloaded Successfully"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              capturedImage != null
                  ? Image.memory(capturedImage)
                  : Container(),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (capturedImage != null) {
                      captureAndSaveImage(capturedImage);
                      shareCapturedImage();
                    }
                  },
                  child: Text('Share Image'),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void shareCapturedImage() async {
    final directory = await getExternalStorageDirectory();
    final fileName = 'my_captured_image.png';
    final filePath = '${directory?.path}/$fileName';

    if (await File(filePath).exists()) {
      Share.shareFiles([filePath], text: 'Check out this image!');
    } else {
      print('Image file does not exist');
    }
  }


  _saved(image) async {
    final result = await ImageGallerySaver.saveImage(image);
    print("File Saved to Gallery");
  }

  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _imageFile = image != null ? File(image.path) : null;
    });
  }

  final Uri _url = Uri.parse('https://siva-pythonpirates.github.io');

  Future<void> _openWebsite() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'My App - Home Screen',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Screenshot(
                controller: screenshotController,
                child: Stack(
                  children: <Widget>[
                    if (_imageFile != null) Image.file(_imageFile!),
                    Container(

                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        "https://siva-pythonpirates.github.io/temp_final.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
          Container(
            margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.666, 0, 0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Image.network('https://siva-pythonpirates.github.io/ic_launcher.png'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: 100,
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Planting for a better tomorrow',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
]
        ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  height:MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.width*0.45,
                  child: ElevatedButton(
                    onPressed: _takePicture,
                    child: Text('Capture Picture'),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),

                  Container(
                    height:MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.45,
                    child: ElevatedButton(
                      child: Text('Download Image'),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                      ),
                      onPressed: () {
                        screenshotController
                            .capture(delay: Duration(milliseconds: 10))
                            .then((capturedImage) async {
                          ShowCapturedWidget(context, capturedImage!);
                          _saved(capturedImage);
                        }).catchError((onError) {
                          print(onError);
                        });

                        const snackdemo = SnackBar(
                          content: Text('Image saved to your phone\'s gallery...Check it Out!!'),
                          // backgroundColor: Colors.green,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackdemo);

                      },
                    ),
                  ),
                ],
              ),

              Container(
                height:MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width*0.6,
                margin : EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: _openWebsite,
                  child: Text('Download Certificate'),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}