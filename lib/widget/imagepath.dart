import 'package:flutter/cupertino.dart';

class AppImages {
  static const List<String> categoryList = [
    'assets/person/musa512.png',
    'assets/person/m1.png',
    'assets/person/m2.png',
    'assets/person/m3.png',
  ];

  static const List<String> flashSaleList = [
    'assets/flash/88CAB39F-4168-412E-A874-015ED4199CF3.png',
    'assets/flash/333CBBCA-9390-4C5A-A60A-21E776BF77D2.png',
    'assets/flash/2289C231-211F-4850-B7AF-5EF0F942B4F7.png',
    'assets/flash/92265483-9E7E-4FC3-A355-16CCA677C11C.png',
    'assets/flash/333CBBCA-9390-4C5A-A60A-21E776BF77D2.png',
    'assets/flash/88CAB39F-4168-412E-A874-015ED4199CF3.png',
  ];

  static const String profileImage = 'assets/musa.jpeg';

  static const List<String> recentlyViewedImages = [
    'assets/person/musa512.png',
    'assets/person/m1.png',
    'assets/person/m2.png',
    'assets/person/m3.png',
    'assets/musa.jpeg',
  ];

  // ✅ New products list with label
  static final List<Map<String, String>> products = List.generate(
    flashSaleList.length,
        (index) => {
      "image": flashSaleList[index],
      "price": "\$17.00",
      "label": "Best Deal", // 👉 তোমার পছন্দ মতো লিখো: New, Sale, Hot etc.
    },
  );
}
