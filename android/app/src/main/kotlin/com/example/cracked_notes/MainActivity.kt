package com.coder2505.cracked_notes

import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Bundle
import android.util.Log
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.PeriodicWorkRequest
import androidx.work.WorkManager
import com.example.cracked_notes.datastore.DataStore
import com.example.cracked_notes.datastore.JsonDataStore
import com.example.cracked_notes.worker.FetchDataWorker
import com.example.cracked_notes.worker.ProblemSolvedWorker
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.TimeUnit

class MainActivity : FlutterActivity() {

    private val channel = "getbattery/kotlin"

    private val TAG = "MainActivity"

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

    override fun onCreate(savedInstanceState: Bundle?) {
        try {

            super.onCreate(savedInstanceState)
            Log.d(TAG, "onCreate: Application started.")

            val oneTimeRequest = OneTimeWorkRequestBuilder<FetchDataWorker>()
                .build()

            WorkManager.getInstance(context)
                .enqueue(oneTimeRequest)

            val problemFetchWork = OneTimeWorkRequestBuilder<ProblemSolvedWorker>()
                .build()

            WorkManager.getInstance(context)
                .enqueue(problemFetchWork)

//            val workRequest =
//                PeriodicWorkRequest.Builder(
//                    FetchDataWorker::class.java, // Your worker class
//                    4, // repeating interval
//                    TimeUnit.HOURS,
//                    15, // flex interval - worker will run somewhen within this period of time, but at the end of repeating interval
//                    TimeUnit.MINUTES
//                ).build()
//
//            WorkManager
//                .getInstance(this)
//                .enqueueUniquePeriodicWork(
//                    "update_widgets",
//                    ExistingPeriodicWorkPolicy.UPDATE,
//                    workRequest
//                )

        } catch (e: Exception) {
            Log.e(TAG, "onCreate: ", e)
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

