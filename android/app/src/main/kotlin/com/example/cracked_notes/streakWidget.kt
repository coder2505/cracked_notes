package com.example.cracked_notes

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.TextUnit
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


class Widgets : GlanceAppWidgetReceiver(){

    override val glanceAppWidget: GlanceAppWidget = StreakWidget()

}

class StreakWidget : GlanceAppWidget (){

    override suspend fun provideGlance(context: Context, id: GlanceId) {

        provideContent {

            UI()

        }
    }

    @Preview
    @Composable
    fun UI(){

        Column(modifier = GlanceModifier.fillMaxSize().padding(16.dp).background(Color(0XFF1E1E1E))) {
            Text("Streak", style = TextStyle(color = ColorProvider(Color.White), fontFamily = FontFamily.Monospace))
            Box(
                modifier = GlanceModifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text("100", style = TextStyle(color = ColorProvider(Color(0xffd64a4a)), fontSize = 72.sp, fontWeight = FontWeight.Bold ,fontFamily = FontFamily.SansSerif))
            }
        }

    }

}


