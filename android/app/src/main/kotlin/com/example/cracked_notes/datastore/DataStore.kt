package com.example.cracked_notes.datastore

import android.content.Context
import android.preference.PreferenceDataStore
import androidx.datastore.core.DataStore
import androidx.datastore.core.DataStoreFactory
import androidx.datastore.dataStore
import androidx.datastore.preferences.core.PreferenceDataStoreFactory
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import androidx.datastore.preferences.preferencesDataStoreFile
import com.example.cracked_notes.retrofit.data_objects.ProblemsSolvedDataObject
import com.example.cracked_notes.retrofit.serializer.ProblemSolvedSerializer
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map

object DataStore {

//    private lateinit var dataStore: DataStore<Preferences>
//
//    fun init(context: Context) {
//        dataStore = PreferenceDataStoreFactory.create(
//            produceFile = {
//                context.applicationContext.preferencesDataStoreFile("settings")
//            }
//        )
//    }

    private val Context.streakDataStore: DataStore<Preferences> by preferencesDataStore(
        name = "settings",
    )

//    val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "settings")

    suspend fun read(context: Context,key:String): String? {

        val prefKey = stringPreferencesKey(name = key)
        val value = context.streakDataStore.data.map { preferences ->
            preferences[prefKey]
        }.first()

        return value
    }

    suspend fun write(context: Context,key: String, value: String){

        val prefKey = stringPreferencesKey(name = key)

        context.streakDataStore.edit { settings ->
            settings[prefKey] = value
        }


    }


}