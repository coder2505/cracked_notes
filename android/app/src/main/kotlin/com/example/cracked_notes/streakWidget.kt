package com.example.cracked_notes

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.provideContent
import androidx.glance.layout.Alignment
import androidx.glance.layout.Column
import androidx.glance.text.Text


class Widgets : GlanceAppWidgetReceiver(){

    override val glanceAppWidget: GlanceAppWidget = StreakWidget()

}


class StreakWidget : GlanceAppWidget (){

    override suspend fun provideGlance(context: Context, id: GlanceId) {

        provideContent {
            Column(modifier = GlanceModifier, horizontalAlignment = Alignment.Start){

                Text("Streak")
                Text("1")

            }
        }
    }

}


