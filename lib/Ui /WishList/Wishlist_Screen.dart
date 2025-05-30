import 'package:flutter/material.dart';
import '../../widget/imagepath.dart';

class WishlistScreen extends StatelessWidget {
  final List<String> recentUsers = AppImages.recentlyViewedImages;

  final List<Map<String, dynamic>> wishlistItems = [
    {
      'image': AppImages.flashSaleList[0],
      'desc': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$17.00',
      'discount': null,
    },
    {
      'image': AppImages.flashSaleList[1],
      'desc': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$12.00',
      'discount': '\$17.00',
    },
    {
      'image': AppImages.flashSaleList[2],
      'desc': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$27.00',
      'discount': null,
    },
    {
      'image': AppImages.flashSaleList[3],
      'desc': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$19.00',
      'discount': null,
    },
  ];

   WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Wishlist",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Recently Viewed Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Recently viewed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentUsers.length,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.only(right: 10),
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(recentUsers[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Wishlist Items
          ...wishlistItems.map((item) => Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with delete button
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item['image'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 6,
                      left: 6,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14,
                        child: Icon(Icons.delete,
                            color: Colors.red, size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),

                // Product Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['desc'],
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          if (item['discount'] != null)
                            Text(
                              item['discount'],
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                          const SizedBox(width: 6),
                          Text(item['price'],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: const [
                          Chip(
                              label: Text("Pink"),
                              backgroundColor: Color(0xfff1f1f1)),
                          SizedBox(width: 6),
                          Chip(
                              label: Text("M"),
                              backgroundColor: Color(0xfff1f1f1)),
                        ],
                      ),
                    ],
                  ),
                ),

                // Move to cart button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_checkout_outlined,
                      color: Colors.blue, size: 30),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
