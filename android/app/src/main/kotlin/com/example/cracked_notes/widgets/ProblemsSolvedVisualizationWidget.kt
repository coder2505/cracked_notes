package com.example.cracked_notes.widgets

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.RectF
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.core.graphics.createBitmap
import androidx.core.graphics.toColorInt
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.cornerRadius
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.ContentScale
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.size
import androidx.glance.layout.width
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider


class ProblemsSolvedVisualizationWidget : GlanceAppWidgetReceiver() {

    override val glanceAppWidget: GlanceAppWidget = Widget()


}

data class ChartSegment(val value: Float, val color: Int)

private class Widget : GlanceAppWidget() {
    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {

            Column(
                modifier = GlanceModifier.fillMaxSize().background(color = Color(0xff1b1b1b)),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalAlignment = Alignment.CenterVertically
            ) {
                ProgressWidgetUI()
                Spacer(GlanceModifier.height(16.dp))
                Index()
            }


        }
    }
}


@Composable
fun Index() {

    Row(
        modifier = GlanceModifier.fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {

        Spacer(modifier = GlanceModifier.defaultWeight())


        Row(verticalAlignment = Alignment.Vertical.CenterVertically) {
            Box(
                modifier = GlanceModifier.width(10.dp).height(10.dp).cornerRadius(5.dp)
                    .background(Color.Green)
            ) { }
            Spacer(GlanceModifier.width(4.dp))
            Text(
                "50",
                style = TextStyle(color = ColorProvider(Color.White), fontWeight = FontWeight.Bold)
            )
        }

        Spacer(modifier = GlanceModifier.defaultWeight())

        Row(verticalAlignment = Alignment.Vertical.CenterVertically) {
            Box(
                modifier = GlanceModifier.width(10.dp).height(10.dp).cornerRadius(5.dp)
                    .background(Color.Yellow)
            ) { }
            Spacer(GlanceModifier.width(4.dp))
            Text(
                "30",
                style = TextStyle(color = ColorProvider(Color.White), fontWeight = FontWeight.Bold)
            )
        }

        Spacer(modifier = GlanceModifier.defaultWeight())

        Row(verticalAlignment = Alignment.Vertical.CenterVertically) {
            Box(
                modifier = GlanceModifier.width(10.dp).height(10.dp).cornerRadius(5.dp)
                    .background(Color.Red)
            ) { }
            Spacer(GlanceModifier.width(4.dp))
            Text(
                "20",
                style = TextStyle(color = ColorProvider(Color.White), fontWeight = FontWeight.Bold)
            )
        }

        Spacer(modifier = GlanceModifier.defaultWeight())


    }


}


@Composable
fun ProgressWidgetUI() {
    val segments = listOf(
        ChartSegment(50f, "#4CAF50".toColorInt()), // Green
        ChartSegment(30f, "#FFC107".toColorInt()), // Yellow
        ChartSegment(20f, "#F44336".toColorInt())  // Red
    )

    // Generate the Bitmap (Ensure sizePx matches your widget design)
    val chartBitmap = createCircularChartBitmap(
        segments = segments,
        sizePx = 300,
        strokeWidthPx = 15f
    )

    Box(
        contentAlignment = Alignment.Center,
        modifier = GlanceModifier.size(100.dp) // Display size in Widget
    ) {
        // 1. The Chart Image
        Image(
            provider = ImageProvider(chartBitmap),
            contentDescription = "Progress Chart",
            contentScale = ContentScale.Fit,
            modifier = GlanceModifier.size(100.dp)
        )

        // 2. The Text Overlay
        Text(
            text = "100",
            style = TextStyle(
                color = ColorProvider(Color.White),
                fontSize = 40.sp,
                fontWeight = FontWeight.Bold
            )
        )
    }
}


fun createCircularChartBitmap(
    segments: List<ChartSegment>,
    sizePx: Int,
    strokeWidthPx: Float
): Bitmap {
    // 1. Create a blank bitmap
    val bitmap = createBitmap(sizePx, sizePx)
    val canvas = Canvas(bitmap)

    // 2. Prepare the Paint
    val paint = Paint().apply {
        isAntiAlias = true
        style = Paint.Style.STROKE
        strokeWidth = strokeWidthPx
        strokeCap = Paint.Cap.ROUND // Makes the ends rounded if you want
    }

    // 3. Define the drawing area (with padding for stroke)
    val padding = strokeWidthPx / 2
    val rect = RectF(padding, padding, sizePx - padding, sizePx - padding)

    // 4. Calculate total for percentages
    val total = segments.sumOf { it.value.toDouble() }.toFloat()
    var startAngle = -90f // Start from top (12 o'clock)

    // 5. Draw each segment
    for (segment in segments) {
        val sweepAngle = (segment.value / total) * 360f

        paint.color = segment.color

        // Draw the arc
        canvas.drawArc(rect, startAngle, sweepAngle, false, paint)

        startAngle += sweepAngle
    }

    return bitmap
}






