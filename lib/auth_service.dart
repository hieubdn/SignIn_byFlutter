import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';

String generateCodeVerifier() {
  final rng = Random.secure();
  final bytes = List<int>.generate(32, (i) => rng.nextInt(256));
  return base64Url.encode(bytes).replaceAll('=', '');
}

String generateCodeChallenge(String codeVerifier) {
  final bytes = utf8.encode(codeVerifier);
  final digest = sha256.convert(bytes);
  return base64Url.encode(digest.bytes).replaceAll('=', '');
}

class AuthService {
  late String codeVerifier;

  AuthService() {
    codeVerifier = generateCodeVerifier();
  }

  String getAuthorizationUrl() {
    final codeChallenge = generateCodeChallenge(codeVerifier);
    return 'https://oauth.zaloapp.com/v4/oa/permission'
        '?app_id=1269268458224712782'
        '&redirect_uri=https://www.fidovn.com/website/'
        '&code_challenge=$codeChallenge'
        '&code_challenge_method=S256'
        '&state=fidovnapp';
  }
}

