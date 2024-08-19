// import 'package:flutter/material.dart';
// import 'auth_service.dart';

// class CallbackHandler extends StatelessWidget {
//   final String authorizationCode;
//   final String codeVerifier;

//   CallbackHandler({required this.authorizationCode, required this.codeVerifier});

//   @override
//   Widget build(BuildContext context) {
//     fetchAccessToken(authorizationCode, codeVerifier).then((tokenData) {
//       // Xử lý tokenData
//       print('Access Token: ${tokenData['access_token']}');
//     }).catchError((error) {
//       // Xử lý lỗi
//       print('Error: $error');
//     });

//     return Scaffold(
//       appBar: AppBar(title: Text('Callback Handler')),
//       body: Center(
//         child: Text('Processing...'),
//       ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:uni_links/uni_links.dart';
// import 'auth_service.dart';
// import 'dart:async';


// class CallbackHandler extends StatefulWidget {
//   @override
//   _CallbackHandlerState createState() => _CallbackHandlerState();
// }

// class _CallbackHandlerState extends State<CallbackHandler> {
//   late StreamSubscription _sub;
//   final AuthService _authService = AuthService();
//   final String _codeVerifier = 'YOUR_CODE_VERIFIER'; // Lưu trữ code verifier đã tạo

//   @override
//   void initState() {
//     super.initState();
//     _sub = linkStream.listen((String? link) async {
//       if (link != null) {
//         final uri = Uri.parse(link);
//         final code = uri.queryParameters['code'];
//         final state = uri.queryParameters['state'];

//         if (code != null) {
//           try {
//             final tokenData = await _authService.fetchAccessToken(code, _codeVerifier);
//             print('Access Token: ${tokenData['access_token']}');
//           } catch (error) {
//             print('Error: $error');
//           }
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _sub.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Callback Handler')),
//       body: Center(
//         child: Text('Processing...'),
//       ),
//     );
//   }
// }
