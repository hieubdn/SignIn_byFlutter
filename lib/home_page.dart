import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final User? user = await signInWithGoogle();
            if (user != null) {
              // Hiển thị thông tin người dùng
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(user: user),
                ),
              );
            }
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  final User user;

  UserProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${user.displayName ?? 'No Name'}'),
            Text('ID: ${user.uid}'),
            if (user.photoURL != null) 
              Image.network(user.photoURL!),
          ],
        ),
      ),
    );
  }
}
