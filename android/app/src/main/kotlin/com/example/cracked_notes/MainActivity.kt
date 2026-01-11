package com.coder2505.cracked_notes

import Constants
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.SharedPreferences
import android.os.BatteryManager
import android.os.Bundle
import android.util.Log
import androidx.lifecycle.lifecycleScope
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import com.example.cracked_notes.datastore.DataStore
import com.example.cracked_notes.worker.FetchDataWorker
import com.example.cracked_notes.worker.ProblemSolvedWorker
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.KeyData.CHANNEL
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.launch


/**
 *Shared preferences ka file -> username, password
 * this is wrote by flutter,
 * native only reads this, does not write to it.
 *
 * another is datastore ka file
 * this has widget required data.
 * this now runs on onCreate, which checks sharedpreferences boolean logged in value and calls api
 * and updates data store.
 *
 **/

class MainActivity : FlutterActivity() {

    private val TAG = "MainActivity"

    private val CHANNEL = "userLoggedIn/kotlin"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            if (call.method == "userLoggedIn") {

                Log.d(TAG, "configureFlutterEngine: HI")

                callStreakWorker()

                result.success(0)

            } else result.notImplemented()

            // TODO
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


    fun callStreakWorker(){
        val oneTimeRequest = OneTimeWorkRequestBuilder<FetchDataWorker>()
            .build()

        WorkManager.getInstance(context)
            .enqueue(oneTimeRequest)

        val problemFetchWork = OneTimeWorkRequestBuilder<ProblemSolvedWorker>()
            .build()

        WorkManager.getInstance(context)
            .enqueue(problemFetchWork)
    }


}

