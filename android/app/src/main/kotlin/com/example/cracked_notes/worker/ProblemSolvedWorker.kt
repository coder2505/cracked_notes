package com.example.cracked_notes.worker

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.glance.appwidget.updateAll
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.example.cracked_notes.datastore.JsonDataStore
import com.example.cracked_notes.retrofit.RetrofitInstance
import com.example.cracked_notes.retrofit.data_objects.ProblemsSolvedDataObject
import com.example.cracked_notes.retrofit.data_objects.UserDataObject
import com.example.cracked_notes.widgets.ProblemsSolvedVisualizationWidget


class ProblemSolvedWorker(appContext: Context, params: WorkerParameters) :
    CoroutineWorker(appContext, params) {

    private val TAG = "ProblemSolvedWorker Coroutine"

    override suspend fun doWork(): Result {


        return try {

            Log.d(TAG, "onCreate: inside worker pls god")

            val sharedPref : SharedPreferences = applicationContext.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)

            val username = sharedPref.getString("flutter.username", "purpleCrayon") ?: "purpleCrayon"
            val isLoggedIn = sharedPref.getBoolean("flutter.isUserLoggedIn", false)

            val response =
                RetrofitInstance.api.getProblemSolved(userDataObject = UserDataObject(userName = username))

            Log.d(TAG, "doWork: after calling the api")
            if (response.isSuccessful && isLoggedIn) {
                Log.d(TAG, "doWork: problemSolved Worker has retrieved the data ${response.body()}")

                if (response.body() != null) {

                    JsonDataStore.write(applicationContext, response.body()!!)
                    Log.d(
                        TAG,
                        "doWork: problemSolved worker has finished the work and wrote to JSON"
                    )
                    ProblemsSolvedVisualizationWidget().updateAll(context = applicationContext)
                    Result.success()

                }

                Result.retry()
            } else if(!isLoggedIn){

                JsonDataStore.write(applicationContext, ProblemsSolvedDataObject(-1,-1,-1,-1))
                Log.d(
                    TAG,
                    "doWork: problemSolved worker has finished, user is not logged in."
                )
                ProblemsSolvedVisualizationWidget().updateAll(context = applicationContext)
                Result.success()

            }
            else {
                Log.e(TAG, "RETRYING WORK: ")
                Result.retry()
            }

            Result.success()
        } catch (ex: Exception) {


            Log.e(TAG, "doWork: ", ex)
            Result.failure();

        }

    }


}