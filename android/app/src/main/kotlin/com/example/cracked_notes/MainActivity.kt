package com.coder2505.cracked_notes

import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val channel = "getbattery/kotlin"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {

            call, result ->

            if(call.method == "getbatterylevel"){
                val battery = getbatteryLevel()
                result.success(battery)

            } else result.notImplemented()

        }
    }

    fun getbatteryLevel(): Int {

        print("hi from kotlin")

        val battery: Intent? = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { filter ->
            context.registerReceiver(null, filter)
        }

        val level: Int = battery?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1

        return level

    }
}

