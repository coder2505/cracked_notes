package com.example.cracked_notes.retrofit.data_objects
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class ProblemsSolvedDataObject(
    @SerialName("easySolved")
    val easySolved: Int,

    @SerialName("hardSolved")
    val hardSolved: Int,

    @SerialName("mediumSolved")
    val mediumSolved: Int,

    @SerialName("solvedProblem")
    val solvedProblem: Int
)