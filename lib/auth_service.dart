import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: '540468946597-lqjt7aimfsftmd789rtkls2rl0kcd1kg.apps.googleusercontent.com',
);

Future<User?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // Người dùng hủy bỏ đăng nhập
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;

    return user;
  } catch (e) {
    // Xử lý lỗi đăng nhập
    print('Lỗi đăng nhập Google: $e');
    return null;
  }
}
