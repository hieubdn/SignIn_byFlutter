import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfilePage extends StatelessWidget {
  final User user;

  const UserProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  Future<String?> getAccessToken() async {
    return await user.getIdToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (user.photoURL != null)
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
                radius: 40,
              ),
            const SizedBox(height: 16),
            Text('Name: ${user.displayName ?? 'No Name'}', style: const TextStyle(fontSize: 20)),
            Text('Email: ${user.email ?? 'No Email'}', style: const TextStyle(fontSize: 20)),
            Text('User ID: ${user.uid}', style: const TextStyle(fontSize: 20)),
            FutureBuilder<String?>(
              future: getAccessToken(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text('Access Token: ${snapshot.data}', style: const TextStyle(fontSize: 20));
                } else {
                  return const Text('Access Token: null', style: TextStyle(fontSize: 20));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


