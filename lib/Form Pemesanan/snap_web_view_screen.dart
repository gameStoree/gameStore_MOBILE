import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/ipconfig.dart';
import 'package:project/Form Pemesanan/pemesananJoki.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class SnapWebViewScreen extends StatefulWidget {
  static const routeName = '/snap-webview';

  final Map<String, dynamic> orderData;

  const SnapWebViewScreen({Key? key, required this.orderData})
      : super(key: key);

  @override
  State<SnapWebViewScreen> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<SnapWebViewScreen> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final url = routeArgs['url'];
    final orderData = routeArgs['orderData'];

    String getValueAsString(dynamic value) {
      return value != null ? value.toString() : 'Tidak ada data';
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: WebView(
                initialUrl: url,
                onPageStarted: (url) {
                  setState(() {
                    loadingPercentage = 0;
                  });
                },
                onProgress: (progress) {
                  setState(() {
                    loadingPercentage = progress;
                  });
                },
                onPageFinished: (url) {
                  setState(() {
                    loadingPercentage = 100;
                  });
                  if (url.contains('transaction_status=')) {
                    final uri = Uri.parse(url);
                    final transactionStatus =
                    uri.queryParameters['transaction_status'];
                    print('Transaction Status: $transactionStatus');
                    if (transactionStatus == 'settlement') {
                      final id = getValueAsString(orderData['id']);
                      if (id.startsWith('INVD')) {
                        updateStatusDiamond(id);
                      } else if (id.startsWith('INVJ')) {
                        updateStatusJoki(id);
                      }
                      Navigator.popUntil(context, ModalRoute.withName('/home'));
                    }
                  }
                },
                navigationDelegate: (navigation) {
                  final host = Uri.parse(navigation.url).toString();
                  if (host.contains('gojek://') ||
                      host.contains('shopeeid://') ||
                      host.contains('//wsa.wallet.airpay.co.id/') ||
                      host.contains('/gopay/partner/') ||
                      host.contains('/shopeepay/') ||
                      host.contains('/pdf')) {
                    _launchInExternalBrowser(Uri.parse(navigation.url));
                    return NavigationDecision.prevent;
                  } else {
                    return NavigationDecision.navigate;
                  }
                },
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 30,
              width: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2852)),
                child: const Text('Exit', style: TextStyle(fontSize: 10)),
              ),
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInExternalBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> updateStatusJoki(String transactionId) async {
    final url = Uri.parse('${Ipconfig.baseUrl}/status');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'transaction_id': transactionId,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('Transaction status updated successfully');
      } else {
        print(
            'Failed to update transaction status. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> updateStatusDiamond(String id) async {
    final url = Uri.parse('${Ipconfig.baseUrl}/status_diamond');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'id': id});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('Status updated successfully');
      } else {
        print('Failed to update status. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
