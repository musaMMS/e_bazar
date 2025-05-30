import 'package:e_bazar/Ui%20/Cart/EditAddress_Screebn.dart';
import 'package:e_bazar/Ui%20/Cart/EditContact_screen.dart';
import 'package:e_bazar/Ui%20/Cart/VoucherCard.dart';
import 'package:flutter/material.dart';

import '../../widget/imagepath.dart';
import 'BkashPayment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String shippingAddress = "123/ABC Road, Dhaka";
  String contactInfo = "017XXXXXXXX";
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> paymentItems = [
      {
        'image': AppImages.flashSaleList[0],
        'title': 'Lorem ipsum dolor sit amet consectetur.',
        'price': '\$17.00',
        'qty': 1,
      },
      {
        'image': AppImages.flashSaleList[1],
        'title': 'Lorem ipsum dolor sit amet consectetur.',
        'price': '\$17.00',
        'qty': 1,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Address
            // Update onEdit calls
            _buildEditableCard(
              title: "Shipping Address",
              content: shippingAddress,
              onEdit: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditAddressScreen(initialAddress: shippingAddress)),
                );
                if (result != null) {
                  setState(() {
                    shippingAddress = result;
                  });
                }
              },
            ),
            SizedBox(height: 10,),

            _buildEditableCard(
              title: "Contact Information",
              content: contactInfo,
              onEdit: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditContactScreen(initialContact: contactInfo)),
                );
                if (result != null) {
                  setState(() {
                    contactInfo = result;
                  });
                }
              },
            ),

            const SizedBox(height: 24),

            // Items Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Items (${paymentItems.length})", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VoucherScreen()));
                }, child: const Text("Add Voucher")),
              ],
            ),
            const SizedBox(height: 12),
            ...paymentItems.map((item) => _buildItemRow(item)).toList(),
            const SizedBox(height: 24),

            // Shipping Options
            const Text("Shipping Options", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            _buildShippingOption("Standard", "5-7 days", "FREE", selected: true),
            _buildShippingOption("Express", "1-2 days", "\$12.00", selected: false),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("Delivered on or before Thursday, 23 April 2020", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),

            const SizedBox(height: 20),

            // Payment Method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Payment Method", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade50,
              ),
              child: const Text("Card", style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildEditableCard({
    required String title,
    required String content,
    required VoidCallback onEdit,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(content, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(item['image']),
            radius: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(item['title'], style: const TextStyle(fontSize: 14)),
          ),
          Text(item['price'], style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildShippingOption(String title, String time, String cost, {required bool selected}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: selected ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: selected ? Colors.blue : Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(fontSize: 14)),
          const Spacer(),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.blue)),
          const SizedBox(width: 12),
          Text(cost, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5,)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Total \$34.00", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BkashWebViewScreen(
                    paymentUrl: 'https://sandbox.sslcommerz.com/EasyCheckout/testcd4d6e7e17e7d3f09b730bc1769c86c1', // এটিকে তোমার SSLCommerz checkout URL দিয়ে replace করো
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text("Pay", style: TextStyle(color: Colors.white)),
          ),

        ],
      ),
    );
  }
}
