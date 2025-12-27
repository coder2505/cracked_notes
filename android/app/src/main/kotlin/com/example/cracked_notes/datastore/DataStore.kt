package com.example.cracked_notes.datastore

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.PreferenceDataStoreFactory
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import androidx.datastore.preferences.preferencesDataStoreFile
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.flow.map

object DataStore {

    private lateinit var dataStore: DataStore<Preferences>

    fun init(context: Context) {
        dataStore = PreferenceDataStoreFactory.create(
            produceFile = {
                context.applicationContext.preferencesDataStoreFile("settings")
            }
        )
    }

//    val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "settings")

    suspend fun read(key:String): String? {

        val prefKey = stringPreferencesKey(name = key)
        val value = dataStore.data.map { preferences ->
            preferences[prefKey]
        }.first()

        return value
    }

    suspend fun write(key: String, value: String){

        val prefKey = stringPreferencesKey(name = key)

        dataStore.edit { settings ->
            settings[prefKey] = value
        }


    }


}