package com.fidovn

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import android.content.Intent // <-- Add this line
import com.zing.zalo.zalosdk.oauth.ZaloSDK // <-- Add this line
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.webviewflutter.WebViewFlutterPlugin

class MainActivity: FlutterActivity() {
    override fun onActivityResult(requestCode:Int, resultCode:Int, data: Intent) {
        super.onActivityResult(requestCode, resultCode, data)
        ZaloSDK.Instance.onActivityResult(this, requestCode, resultCode, data) // <-- Add this line
    }
}