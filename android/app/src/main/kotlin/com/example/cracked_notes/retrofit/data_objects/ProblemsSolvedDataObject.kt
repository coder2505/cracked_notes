package com.example.cracked_notes.retrofit.data_objects

import kotlinx.serialization.Serializable

@Serializable
data class ProblemsSolvedDataObject(
    val easySolved: Int,
    val hardSolved: Int,
    val mediumSolved: Int,
    val solvedProblem: Int
)