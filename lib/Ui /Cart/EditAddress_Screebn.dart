import 'package:flutter/material.dart';

class EditAddressScreen extends StatefulWidget {
  final String initialAddress;
  const EditAddressScreen({super.key, required this.initialAddress});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(text: widget.initialAddress);
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    Navigator.pop(context, _addressController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Address")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Shipping Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAddress,
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
