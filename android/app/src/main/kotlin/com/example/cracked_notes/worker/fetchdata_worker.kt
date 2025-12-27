package com.example.cracked_notes.worker

import Constants
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.glance.appwidget.updateAll
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.example.cracked_notes.StreakWidget
import com.example.cracked_notes.datastore.DataStore
import com.example.cracked_notes.retrofit.RetrofitInstance
import com.example.cracked_notes.retrofit.data_objects.UserDataObject
import io.flutter.plugins.sharedpreferences.TAG

class FetchDataWorker(appContext: Context, workerParameters: WorkerParameters) :
    CoroutineWorker(appContext, workerParameters) {

    override suspend fun doWork(): Result {

        return try{

            Log.d(TAG, "onCreate: inside worker")

            val response = RetrofitInstance.api.getUserStreak(userDataObject = UserDataObject(userName = "cpcs"))

            if(response.isSuccessful){
                Log.d(TAG, "doWork: worker has retrieved the data ${response.body()}")
                DataStore.write(Constants.STREAK_COUNT, response.body()?.streak.toString())
                Log.d(TAG, "doWork: worker has finished the work and wrote to datastore")
                StreakWidget().updateAll(context = applicationContext)
                Result.success()

            }else{
                Log.e(TAG, "RETRYING WORK: ", )
                Result.retry()
            }


        }catch (ex: Exception){
            Log.e(TAG, "FAILED TO DO WORK WORKMAGAER", ex)
            Result.failure();
        }

    }

}