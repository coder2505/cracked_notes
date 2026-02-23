package com.example.cracked_notes.widgets

import Constants
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.LocalSize
import androidx.glance.action.ActionParameters
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.action.ActionCallback
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.text.FontFamily
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.coder2505.cracked_notes.MainActivity
import com.coder2505.cracked_notes.R
import com.example.cracked_notes.actionCallBack.RefreshButtonStreak
import com.example.cracked_notes.datastore.DataStore


class Widgets : GlanceAppWidgetReceiver() {

    override val glanceAppWidget: GlanceAppWidget = StreakWidget()

}

class StreakWidget : GlanceAppWidget() {

    private val TAG = "StreakWidget"

    override suspend fun provideGlance(context: Context, id: GlanceId) {

        Log.d(TAG, "provideGlance: entered")

        val streak = DataStore.read(context, Constants.STREAK_COUNT) ?: "0"

        Log.d(TAG, "provideGlance: Read data from datastore")

        provideContent {

            Box(
                modifier = GlanceModifier.clickable(
                    onClick =
                        actionRunCallback<checkUserLogState>()
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

        if (streak == "-1") {
            streakVal = "Please log in"
        }

        val size  = LocalSize.current
        val height = size.height

        val numberSize : TextUnit = (height.value * 0.75f).sp
        val textSize : TextUnit = (height.value * 0.15f).sp



        Column(
            modifier = GlanceModifier.fillMaxSize().padding(16.dp).background(Color(0XFF1B1B1B))
        ) {
            Row(
                modifier = GlanceModifier.fillMaxWidth()
            ) {
                Text(
                    streakVal,
                    style = TextStyle(
                        fontSize = textSize,
                        color = ColorProvider(Color.White),
                        fontFamily = FontFamily.Monospace
                    )
                )
                Spacer(GlanceModifier.defaultWeight())
                RefreshButton()
            }
            Box(
                modifier = GlanceModifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    streak,
                    style = TextStyle(
                        color = ColorProvider(Color(0xff0071FF)),
                        fontSize = numberSize,
                        fontWeight = FontWeight.Bold,
                        fontFamily = FontFamily.SansSerif
                    )
                )
            }
        }
    }


    @Composable
    fun RefreshButton() {
        Image(
            provider = ImageProvider(R.drawable.baseline_refresh_24),
            contentDescription = "Refresh Data",
            modifier = GlanceModifier
                .size(28.dp).padding(all = 3.dp)
                .clickable(onClick = actionRunCallback<RefreshButtonStreak>()) // Force the image size (optional, but good for control)
        )
    }

}

class checkUserLogState : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {

        val sharedPreferences =
            context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)

        lateinit var route : String;

        if (sharedPreferences.getBoolean("flutter.isUserLoggedIn", false)) {

            route = "/home"

        } else route = "/enterNameScreen"

        val intent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK
            // This is the key: passing the route as an extra
            putExtra("route", route)
        }

        context.startActivity(intent)


    }

}


