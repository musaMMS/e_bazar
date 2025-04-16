import 'package:flutter/material.dart';

class FlashSaleSection extends StatelessWidget {
   FlashSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          flashSaleItem('assets/images/product1.jpg'),
          SizedBox(width: 10),
          flashSaleItem('assets/images/product2.jpg'),
          SizedBox(width: 10),
          flashSaleItem('assets/images/product3.jpg'),
        ],
      ),
    );
  }