package com.example.cracked_notes.datastore

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.core.DataStoreFactory
import androidx.datastore.dataStore
import com.example.cracked_notes.datastore.JsonDataStore.problemsDataStore
import com.example.cracked_notes.retrofit.data_objects.ProblemsSolvedDataObject
import com.example.cracked_notes.retrofit.serializer.ProblemSolvedSerializer
import kotlinx.coroutines.flow.first

object JsonDataStore {

    private val Context.problemsDataStore: DataStore<ProblemsSolvedDataObject> by dataStore(
        fileName = "problemSolved.json",
        serializer = ProblemSolvedSerializer()
    )

    // Read the entire object
    suspend fun read(context: Context): ProblemsSolvedDataObject {
        return context.problemsDataStore.data.first()
    }


    // Write/Update the entire object
    suspend fun write(context: Context , problemsSolved: ProblemsSolvedDataObject) {
        context.problemsDataStore.updateData { problemsSolved }
    }

}