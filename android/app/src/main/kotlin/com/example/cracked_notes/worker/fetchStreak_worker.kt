package com.example.cracked_notes.worker

import Constants
import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.glance.appwidget.updateAll
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.example.cracked_notes.datastore.DataStore
import com.example.cracked_notes.retrofit.RetrofitInstance
import com.example.cracked_notes.retrofit.data_objects.UserDataObject
import com.example.cracked_notes.widgets.StreakWidget
import io.flutter.plugins.sharedpreferences.TAG

class FetchDataWorker(appContext: Context, workerParameters: WorkerParameters) :
    CoroutineWorker(appContext, workerParameters) {

    override suspend fun doWork(): Result {

        return try {

            Log.d(TAG, "onCreate: inside worker")
            val sharedPref: SharedPreferences = applicationContext.getSharedPreferences(
                "FlutterSharedPreferences",
                Context.MODE_PRIVATE
            )

            val username = sharedPref.getString("flutter.username", "cpcs") ?: "cpcs"
            val isLoggedIn = sharedPref.getBoolean("flutter.isUserLoggedIn", false)

            val response =
                RetrofitInstance.api.getUserStreak(userDataObject = UserDataObject(userName = username))

            Log.d(TAG, "doWork: USERNAME -> $username")
            Log.d(TAG, "doWork: HAS LOGGEDIN ->  $isLoggedIn")

            if (response.isSuccessful && isLoggedIn) {
                Log.d(TAG, "doWork: worker has retrieved the data ${response.body()}")
                DataStore.write(
                    context = applicationContext,
                    Constants.STREAK_COUNT,
                    response.body()?.streak.toString()
                )
                Log.d(TAG, "doWork: worker has finished the work and wrote to datastore")
                StreakWidget().updateAll(context = applicationContext)
                Result.success()

            } else if (!isLoggedIn) {
                Log.d(TAG, "doWork: user is not logged in}")
                DataStore.write(context = applicationContext, Constants.STREAK_COUNT, "-1")
                Log.d(TAG, "doWork: wrote please log in to datastore")
                StreakWidget().updateAll(context = applicationContext)
                Result.success()
            } else {
                Log.e(TAG, "RETRYING WORK: ")
                Result.retry()
            }


        } catch (ex: Exception) {
            Log.e(TAG, "FAILED TO DO WORK WORKMAGAER", ex)
            Result.failure();
        }

    }

}