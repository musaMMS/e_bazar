import 'package:e_bazar/AdMob/Interstital_ad.dart';
import 'package:e_bazar/Ui%20/splash_log_sing_/LoginScreen.dart';
import 'package:e_bazar/widget/bottomNavigationbar.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AdHelper.loadInterstitialAd();
  }

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
                AdHelper.showInterstitialAd();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
              AdHelper.showInterstitialAd();
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
