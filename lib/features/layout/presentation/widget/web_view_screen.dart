// screens/secure_webview.dart
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:rowad_hrag/core/services/cash_helper.dart';

class SecureWebView extends StatelessWidget {
  final String url;

  const SecureWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading..."),
        leading: CloseButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(
            Uri.parse(
              url,
            ),
          ),
          headers: <String, String>{
            'Authorization': 'Bearer ${CashHelper.getString('Auth')}',
            'Accept': 'text/html',
          },
        ),
        onLoadStart: (controller, url) {
          debugPrint("Page started loading: $url");
        },
        onLoadStop: (controller, url) async {
          final title = await controller.getTitle();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Loaded: $title")),
            );
          }
        },
        onLoadError: (controller, url, code, message) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: $message")),
            );
          }
        },
      ),
    );
  }
}
