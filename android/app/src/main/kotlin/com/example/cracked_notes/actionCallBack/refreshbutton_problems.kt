package com.example.cracked_notes.actionCallBack

import android.content.Context
import androidx.glance.GlanceId
import androidx.glance.action.ActionParameters
import androidx.glance.appwidget.action.ActionCallback
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import com.example.cracked_notes.worker.ProblemSolvedWorker

class RefreshButtonProblems : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {

        val problemFetchWork = OneTimeWorkRequestBuilder<ProblemSolvedWorker>()
            .build()

        WorkManager.getInstance(context)
            .enqueue(problemFetchWork)

    }
}