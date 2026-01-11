package com.example.cracked_notes.widgets

import Constants
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.util.Log
import android.widget.RemoteViews
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.action.actionStartActivity
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.padding
import androidx.glance.layout.width
import androidx.glance.text.FontFamily
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.coder2505.cracked_notes.MainActivity
import com.coder2505.cracked_notes.R
import com.example.cracked_notes.datastore.DataStore


class Widgets : GlanceAppWidgetReceiver() {

    override val glanceAppWidget: GlanceAppWidget = StreakWidget()

}

class StreakWidget : GlanceAppWidget() {

    private val TAG = "StreakWidget"

    override suspend fun provideGlance(context: Context, id: GlanceId) {

        Log.d(TAG, "provideGlance: entered")

        val streak = DataStore.read(context,Constants.STREAK_COUNT) ?: "0"

        Log.d(TAG, "provideGlance: Read data from datastore")

        provideContent {

            Box(
                modifier = GlanceModifier.clickable(
                    onClick = actionStartActivity<MainActivity>()
                )
            ) {
                UI(streak)
            }

        }
    }



    @Preview
    @Composable
    fun UI(streak: String = "100") {

        Log.d(TAG, "UI: inside widget ui")

        var streakVal = "Streak"

        if(streak=="-1"){
            streakVal = "Please log in"
        }


            Column(
                modifier = GlanceModifier.fillMaxSize().padding(16.dp).background(Color(0XFF1B1B1B))
            ) {
                Row {
                    Text(
                        streakVal,
                        style = TextStyle(
                            color = ColorProvider(Color.White),
                            fontFamily = FontFamily.Monospace
                        )
                    )
                    Spacer(GlanceModifier.width(width = 10.dp))
                    //                RefreshButton()
                }
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


//    @Composable
//    fun RefreshButton() {
//        Image(
//            provider = ImageProvider(R.drawable.baseline_refresh_24),
//            contentDescription = "Refresh Data",
//            modifier = GlanceModifier
//                .size(24.dp) // Force the image size (optional, but good for control)
//                .clickable(onClick = {MainActivity().callStreakWorker()}) // See logic fix below
//        )
//    }

}


