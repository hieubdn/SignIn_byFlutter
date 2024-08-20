import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facebook Login Demo'),
        ),
        body: Center(
          child: FacebookLoginButton(),
        ),
      ),
    );
  }
}

class FacebookLoginButton extends StatefulWidget {
  @override
  _FacebookLoginButtonState createState() => _FacebookLoginButtonState();
}

class _FacebookLoginButtonState extends State<FacebookLoginButton> {
  Map<String, dynamic>? _userData;
  String? _accessToken;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      final userData = await FacebookAuth.instance.getUserData();
      setState(() {
        _userData = userData;
        _accessToken = accessToken.tokenString;
      });
    }
  }

  void _login() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email'],
    );

    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      setState(() {
        _userData = userData;
        _accessToken = accessToken!.tokenString;
      });
      print('Logged in with access token: ${_accessToken}');
    } else {
      print('Login failed: ${result.status}');
      print('Message: ${result.message}');
    }
  }

  void _logout() async {
    await FacebookAuth.instance.logOut();
    setState(() {
      _userData = null;
      _accessToken = null;
    });
    print('Logged out');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _userData == null
            ? Text('Not logged in')
            : Column(
                children: [
                  Text('Logged in as: ${_userData!['name']}'),
                  SizedBox(height: 10),
                  Text('Access Token: $_accessToken'),
                ],
              ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _login,
          child: Text('Login with Facebook'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _logout,
          child: Text('Logout'),
        ),
      ],
    );
  }
}
