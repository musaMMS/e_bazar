import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JustNowSection extends StatefulWidget {
  const JustNowSection({super.key});

  @override
  State<JustNowSection> createState() => _JustNowSectionState();
}

class _JustNowSectionState extends State<JustNowSection> {
  final supabase = Supabase.instance.client;

  List<dynamic> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final response = await supabase.from('products').select();
      print('📦 Products fetched: $response');
      setState(() {
        _products = response;
        _isLoading = false;
      });
    } catch (e) {
      print('❌ Error fetching products: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_products.isEmpty) {
      return const Center(child: Text('😔 No products found.'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Just Now',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                final imageUrl = product['image_url'];
                final name = product['name'];
                final price = product['price'];

                return Container(
                  width: 160,
                  margin: EdgeInsets.only(
                    left: index == 0 ? 16 : 8,
                    right: index == _products.length - 1 ? 16 : 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          imageUrl,
                          height: 160,
                          width: 160,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 160,
                              width: 160,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.broken_image, size: 80),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '৳ $price',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
