// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<UserCredential?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         return null;
//       }

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       if (googleAuth.idToken == null || googleAuth.accessToken == null) {
//         throw Exception("ID Token or Access Token is null");
//       }

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken!,
//         idToken: googleAuth.idToken!,
//       );

//       final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
//       return userCredential;
//     } catch (e) {
//       print("Lỗi đăng nhập với Google: $e");
//       return null;
//     }
//   }

//   User? getUserFromCredential(UserCredential credential) {
//     final user = credential.user;
//     if (user != null) {
//       return User(
//         accessToken: '',
//         id: user.uid,
//         name: user.displayName,
//         email: user.email,
//         photoUrl: user.photoURL,
//       );
//     }
//     return null;
//   }
// }

// class User {
//   final String accessToken;
//   final String id;
//   final String? name;
//   final String? email;
//   final String? photoUrl;

//   User({
//     required this.accessToken,
//     required this.id,
//     this.name,
//     this.email,
//     this.photoUrl,
//   });
// }


// Phiên bản sửa lỗi 1
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print("Lỗi đăng nhập với Google: $e");
      return null;
    }
  }
}
