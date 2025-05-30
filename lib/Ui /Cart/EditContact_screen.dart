import 'package:flutter/material.dart';

class EditContactScreen extends StatefulWidget {
  final String initialContact;
  const EditContactScreen({super.key, required this.initialContact});

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final parts = widget.initialContact.split('\n');
    _phoneController = TextEditingController(text: parts[0]);
    _emailController = TextEditingController(text: parts.length > 1 ? parts[1] : '');
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveContact() {
    final contact = '${_phoneController.text.trim()}\n${_emailController.text.trim()}';
    Navigator.pop(context, contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Contact Info")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveContact,
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
