import 'dart:async';
import 'package:e_bazar/Ui%20/Home/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import '../../widget/imagepath.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required Map<String, String> product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _current = 0;
  late Timer _timer;

  final List<String> imageList = AppImages.flashSaleList;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_current < imageList.length - 1) {
        _current++;
      } else {
        _current = 0;
      }
      _controller.animateToPage(_current);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.favorite_border, size: 28),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  child: const Text("Add to cart"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  child: const Text("Buy now"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔄 Auto Image Slider
            CarouselSlider(
              items: imageList
                  .map((item) => Image.asset(item,
                  fit: BoxFit.cover, width: double.infinity))
                  .toList(),
              options: CarouselOptions(
                height: 300,
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),

            // 🔵 Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key ? Colors.blue : Colors.grey,
                  ),
                );
              }).toList(),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 💰 Price and Description
                  const Text(
                    "\$17.00",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    style: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 16),

                  // 🎨 Variations
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Variations",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Chip(label: Text("Pink")),
                          SizedBox(width: 8),
                          Chip(label: Text("M")),
                        ],
                      ),
                      Icon(Icons.arrow_forward, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 🖼 Variation Images
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: imageList.map((img) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(img,
                                width: 70, height: 70, fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 📝 Specifications
                  const Text("Specifications",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 12),
                  const Text("Material"),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _specTag("Cotton 95%"),
                      const SizedBox(width: 10),
                      _specTag("Nylon 5%"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("Origin"),
                  const SizedBox(height: 8),
                  _specTag("EU"),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Size guide"),
                      Icon(Icons.arrow_forward, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 🚚 Delivery
                  const Text("Delivery",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _deliveryOption("Standard", "5-7 days", "\$3.00"),
                  const SizedBox(height: 8),
                  _deliveryOption("Express", "1-2 days", "\$12.00"),

                  const SizedBox(height: 24),

                  // 🌟 Rating & Review
                  const Text("Rating & Reviews",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star_border, color: Colors.amber),
                      SizedBox(width: 8),
                      Chip(label: Text("4/5")),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                        AssetImage("assets/person/m1.png"),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Veronika",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              Icon(Icons.star_half,
                                  color: Colors.amber, size: 16),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur sadipiscing elit...",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            JustForYouSection(),
          ],
        ),
      ),
    );
  }

  static Widget _specTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(color: Colors.black87)),
    );
  }

  static Widget _deliveryOption(String title, String time, String price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(time, style: const TextStyle(color: Colors.blue)),
          Text(price),
        ],
      ),
    );
  }
}

extension on CarouselController {
  void animateToPage(int current) {}
}
