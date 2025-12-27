package com.example.cracked_notes.retrofit
import com.example.cracked_notes.retrofit.data_objects.StreakDataObject
import com.example.cracked_notes.retrofit.data_objects.UserDataObject
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.POST


interface ApiInterface {

    @POST("/userStreakCount")
    suspend fun getUserStreak(@Body userDataObject: UserDataObject) : Response<StreakDataObject>

}