import 'package:e_bazar/Ui%20/Home/Home_screen.dart';
import 'package:e_bazar/Ui%20/splash_log_sing_/CreateAn_account.dart';
import 'package:e_bazar/widget/bottomNavigationbar.dart';
import 'package:flutter/material.dart';

import '../Home/Card_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade200,
            child: Image.asset(
              'assets/Group 1000004649.png', // Place your image in assets folder
              width: 60,
              height: 60,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Shoppe',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Beautiful eCommerce UI Kit\nfor your online store',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccountScreen()));
              },
              child: Text(
                "Let's get started",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 15),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationScreen())); //OnboardingScreen
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I already have an account',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward, color: Colors.blue, size: 18),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
