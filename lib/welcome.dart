import 'package:flutter/material.dart';
import 'writeup.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Welcome to MyTree App',
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
          ),
        ),
        elevation: 1.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.125 / 2),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Image.network("https://siva-pythonpirates.github.io/ic_launcher.png"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 100, 10, 0),
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width ,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WriteupPage(),
                    ),
                  );
                },

                child: Text('Let\'s Start Planting!'),
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontStyle: FontStyle.italic)),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
