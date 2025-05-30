import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BkashWebViewScreen extends StatefulWidget {
  final String paymentUrl;
  const BkashWebViewScreen({super.key, required this.paymentUrl});

  @override
  State<BkashWebViewScreen> createState() => _BkashWebViewScreenState();
}

class _BkashWebViewScreenState extends State<BkashWebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bkash Payment")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
