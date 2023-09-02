import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the library for loading image assets
import 'camera.dart';

class WriteupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Load the logo image asset
    final logoImage = NetworkImage('https://siva-pythonpirates.github.io/ic_launcher.png'); // Replace with your logo image path

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'MyTreeApp',
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
          ),
        ),
        elevation: 1.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack( // Use a Stack to layer the background image and content
          children: [

            // Background Image
              Padding(
                padding: const EdgeInsets.fromLTRB(0,60,0,0),
                child: Opacity(
                  opacity: 0.3,
                  child: Image(
                    alignment: Alignment.center,
                    image: logoImage,
                    fit: BoxFit.cover, // Adjust the fit as needed
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.5,
            ),
                ),
              ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Trees are the most benevolent givers in nature.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\nPeople who will not sustain trees will soon live in a world that will not sustain people.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\nPlant a tree today for a better tomorrow.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\nTree planting is recognised as one of the most engaging, environmentally-friendly activities that people can participate in to help the planet when done properly.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\nThanks for having the Green Attitude and joining me for planting for tomorrow.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\n\n- Manuel Reginald',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraScreen(),
                      ),
                    );
                  },
                  child: Text('Let\'s Click Some Pictures!'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                    ),
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
