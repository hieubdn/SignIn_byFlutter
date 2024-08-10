package com.fido

import android.app.Application
import com.facebook.FacebookSdk
import com.facebook.appevents.AppEventsLogger

class MyApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        // Initialize the Facebook SDK
        FacebookSdk.sdkInitialize(applicationContext)
        AppEventsLogger.activateApp(this)
    }
}
