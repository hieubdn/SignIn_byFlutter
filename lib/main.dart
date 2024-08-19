import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('LOGIN ZALO')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final authService = AuthService();
              final url = authService.getAuthorizationUrl();
              _launchURL(url);
            },
            child: Text('Login Zalo'),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
