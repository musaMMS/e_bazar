import 'package:e_bazar/Ui%20/splash_log_sing_/Splash_screen.dart';
import 'package:e_bazar/widget/color.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kwkkwbgltghlzpegvqqw.supabase.co',  // তোমার project URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt3a2t3YmdsdGdobHpwZWd2cXF3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg2MjQ0ODYsImV4cCI6MjA2NDIwMDQ4Nn0.dEigg10zFl-yN3zXZ2mPo5_HW3ran443dHkQ-w6Pua8',         // তোমার public anon key
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: SplashScreen(),
    );
  }
}

