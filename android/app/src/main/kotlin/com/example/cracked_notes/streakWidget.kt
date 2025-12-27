package com.example.cracked_notes

import Constants
import android.appwidget.AppWidgetManager
import android.content.Context
import android.util.Log
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.tooling.preview.PreviewParameter
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.padding
import androidx.glance.text.FontFamily
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.example.cracked_notes.datastore.DataStore


class Widgets : GlanceAppWidgetReceiver() {

    override val glanceAppWidget: GlanceAppWidget = StreakWidget()

}

class StreakWidget : GlanceAppWidget() {
    
    private val TAG = "StreakWidget"

    override suspend fun provideGlance(context: Context, id: GlanceId) {

        Log.d(TAG, "provideGlance: entered")

        val streak = DataStore.read(Constants.STREAK_COUNT) ?: "0"

        Log.d(TAG, "provideGlance: Read data from datastore")

        provideContent {

            UI(streak)

        }
    }

    @Preview
    @Composable
    fun UI (streak : String = "100") {

        Log.d(TAG, "UI: inside widget ui")


        Column(
            modifier = GlanceModifier.fillMaxSize().padding(16.dp).background(Color(0XFF1B1B1B))
        ) {
            Text(
                "Streak",
                style = TextStyle(
                    color = ColorProvider(Color.White),
                    fontFamily = FontFamily.Monospace
                )
            )
            Box(
                modifier = GlanceModifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    streak,
                    style = TextStyle(
                        color = ColorProvider(Color(0xff0071FF)),
                        fontSize = 72.sp,
                        fontWeight = FontWeight.Bold,
                        fontFamily = FontFamily.SansSerif
                    )
                )
            }
        }

    }

}


