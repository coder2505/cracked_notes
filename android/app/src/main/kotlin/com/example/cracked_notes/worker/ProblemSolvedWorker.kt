package com.example.cracked_notes.worker

import android.content.Context
import android.util.Log
import androidx.glance.appwidget.updateAll
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.example.cracked_notes.datastore.JsonDataStore
import com.example.cracked_notes.retrofit.RetrofitInstance
import com.example.cracked_notes.retrofit.data_objects.UserDataObject
import com.example.cracked_notes.widgets.ProblemsSolvedVisualizationWidget

class ProblemSolvedWorker(appContext: Context, params: WorkerParameters) :
    CoroutineWorker(appContext, params) {

    private val TAG = "ProblemSolvedWorker Coroutine"

    override suspend fun doWork(): Result {

        return try {

            Log.d(TAG, "onCreate: inside worker pls god")

            val response = RetrofitInstance.api.getProblemSolved(userDataObject = UserDataObject(userName = "purpleCrayon"))

            Log.d(TAG, "doWork: after calling the api")
            if(response.isSuccessful){
                Log.d(TAG, "doWork: problemSolved Worker has retrieved the data ${response.body()}")

                if(response.body() != null){

                    JsonDataStore.write(applicationContext,response.body()!!)
                    Log.d(TAG, "doWork: problemSolved worker has finished the work and wrote to JSON")
                    ProblemsSolvedVisualizationWidget().updateAll(context = applicationContext)
                    Result.success()

                }

                Result.retry()
            }else{
                Log.e(TAG, "RETRYING WORK: ", )
                Result.retry()
            }

            Result.success()
        } catch (ex: Exception) {


            Log.e(TAG, "doWork: ", ex)
            Result.failure();

        }

    }


}