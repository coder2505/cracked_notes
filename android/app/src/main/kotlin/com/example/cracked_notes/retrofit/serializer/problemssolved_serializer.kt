package com.example.cracked_notes.retrofit.serializer

import androidx.datastore.core.CorruptionException
import androidx.datastore.core.Serializer
import com.example.cracked_notes.retrofit.data_objects.ProblemsSolvedDataObject
import kotlinx.serialization.SerializationException
import kotlinx.serialization.json.Json
import java.io.InputStream
import java.io.OutputStream

class ProblemSolvedSerializer :
    Serializer<ProblemsSolvedDataObject> {

    override val defaultValue: ProblemsSolvedDataObject = ProblemsSolvedDataObject(
        easySolved = 60,
        mediumSolved = 30,
        hardSolved = 10,
        solvedProblem = 100
    )

    override suspend fun readFrom(input: InputStream): ProblemsSolvedDataObject {
        try {
            return Json.decodeFromString<ProblemsSolvedDataObject>(
                input.readBytes().decodeToString()
            )
        } catch (serialization: SerializationException) {
            throw CorruptionException("Unable to read ProblemSolvedDataObject", serialization)
        }
    }

    override suspend fun writeTo(t: ProblemsSolvedDataObject, output: OutputStream) {
        output.write(
            Json.encodeToString(t)
                .encodeToByteArray()
        )
    }
}