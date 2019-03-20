package com.example.flutterappkotlin

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  private val CHANNEL = "com.flutter.epic/epic"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { methodCall, result ->
      val arguments = methodCall.arguments<Map<String, Any>>()

      if (methodCall.method == "Printy") {
        var val1 = arguments["val1"]

          if (val1 == "1") {
          result.success("YAY")
        } else {
          result.success("NAY")
        }
      }
    }
  }
}
