import 'package:e_bazar/Ui%20/Cart/Payment_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/person/m1.png',
      'desc': 'Lorem ipsum dolor sit amet consectetur.',
      'color': 'Pink',
      'size': 'M',
      'price': '\$17.00',
      'qty': 1,
    },
    {
      'image': 'assets/person/m2.png',
      'desc': 'Lorem ipsum dolor sit amet consectetur.',
      'color': 'Pink',
      'size': 'M',
      'price': '\$17.00',
      'qty': 1,
    },
  ];

  final List<Map<String, dynamic>> wishlistItems = [
    {
      'image': 'assets/person/m3.png',
      'desc': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$17.00',
    },
    {
      'image': 'assets/person/n20.png',
      'desc': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$17.00',
    },
  ];

  final String shippingAddress =
      '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city';

   CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Cart',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold)
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${cartItems.length}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            )
          ],
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Shipping Address
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, color: Colors.black87),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    shippingAddress,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Show dialog to edit address
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Edit Shipping Address"),
                        content: TextField(
                          controller: TextEditingController(text: shippingAddress),
                          maxLines: 3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter new address",
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Save address logic
                              Navigator.pop(context);
                            },
                            child: const Text("Save"),
                          )
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Cart Items
          ...cartItems.map((item) => Container(
            margin: const EdgeInsets.only(bottom: 20),
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
                        child: Icon(Icons.delete, color: Colors.red, size: 18),
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
                      Text(
                        '${item['color']}, Size ${item['size']}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(item['price'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                // Quantity
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {},
                    ),
                    Text('${item['qty']}'),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          )),

          const Text("From Your Wishlist",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),

          // Wishlist Items
          ...wishlistItems.map((item) => Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Image
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 6,
                      left: 6,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14,
                        child: Icon(Icons.delete, color: Colors.red, size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['desc'],
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 6),
                      Row(
                        children: const [
                          Chip(label: Text("Pink"), backgroundColor: Color(0xfff1f1f1)),
                          SizedBox(width: 6),
                          Chip(label: Text("M"), backgroundColor: Color(0xfff1f1f1)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.shopping_cart_checkout_outlined,
                    color: Colors.blue, size: 30)
              ],
            ),
          )),
        ],
      ),

      // Bottom Checkout Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Total ',
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: '\$34.00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text("Checkout"),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

}
