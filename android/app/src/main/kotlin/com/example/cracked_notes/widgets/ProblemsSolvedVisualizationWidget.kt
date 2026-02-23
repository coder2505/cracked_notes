package com.example.cracked_notes.widgets

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.RectF
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.core.graphics.createBitmap
import androidx.core.graphics.toColorInt
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.LocalSize
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.SizeMode
import androidx.glance.appwidget.action.actionRunCallback
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
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.layout.width
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextAlign
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.coder2505.cracked_notes.R
import com.example.cracked_notes.actionCallBack.RefreshButtonProblems
import com.example.cracked_notes.datastore.JsonDataStore
import com.example.cracked_notes.retrofit.data_objects.ProblemsSolvedDataObject


class ProblemsSolvedVisualization : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = ProblemsSolvedVisualizationWidget()
}


data class ChartSegment(val value: Int, val color: Int)

val BLUE_COLOR: Long = 0xff7FB0FF


class ProblemsSolvedVisualizationWidget : GlanceAppWidget() {

    override val sizeMode: SizeMode = SizeMode.Exact

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        val obj = JsonDataStore.read(context)
        provideContent {
            WidgetRoot(obj)
        }
    }
}

@Composable
fun WidgetRoot(obj: ProblemsSolvedDataObject) {

    val size = LocalSize.current          // DpSize — actual space given by launcher
    val width = size.width                 // Dp  e.g. 176.dp on Samsung, 110.dp on Pixel
    val height = size.height                // Dp  same idea vertically


    val chartSize: Dp = (height.value * 0.60f).dp
        .coerceAtMost((width.value * 0.75f).dp)

    val countFontSize: TextUnit = (chartSize.value * 0.4f).sp

    val legendFontSize: TextUnit = (height.value * 0.08f).sp
    val dotSize: Dp = (height.value * 0.06f).dp

    val gap: Dp = (height.value * 0.07f).dp

    Box(
        modifier = GlanceModifier
            .fillMaxSize()
            .background(Color(0xff1b1b1b))
            .padding(6.dp)
            .clickable(onClick = actionRunCallback<checkUserLogState>())
    ) {
        if (obj.solvedProblem >= 0) {

            // Main content: chart on top, legend below
            Column(
                modifier = GlanceModifier.fillMaxSize(),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalAlignment = Alignment.CenterVertically
            ) {
                DonutChart(
                    easy = obj.easySolved,
                    medium = obj.mediumSolved,
                    hard = obj.hardSolved,
                    chartSize = chartSize,
                    countFontSize = countFontSize
                )

                Spacer(modifier = GlanceModifier.height(gap))

                Legend(
                    easy = obj.easySolved,
                    medium = obj.mediumSolved,
                    hard = obj.hardSolved,
                    dotSize = dotSize,
                    fontSize = legendFontSize
                )
            }

            Row(
                modifier = GlanceModifier.fillMaxWidth(),
                horizontalAlignment = Alignment.Horizontal.End,
                verticalAlignment = Alignment.Vertical.Top
            ) {
                RefreshButton()
            }

        } else {
            Box(
                modifier = GlanceModifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = "Not Logged In",
                    style = TextStyle(
                        textAlign = TextAlign.Center,
                        color = ColorProvider(Color.White),
                        fontSize = legendFontSize
                    )
                )
            }
        }
    }
}


@Composable
fun DonutChart(
    easy: Int,
    medium: Int,
    hard: Int,
    chartSize: Dp,
    countFontSize: TextUnit
) {
    val segments = listOf(
        ChartSegment(easy, "#00C853".toColorInt()),   // green
        ChartSegment(medium, "#FFD600".toColorInt()),   // yellow
        ChartSegment(hard, "#C00000".toColorInt())    // red
    )


    val bitmapPx = (chartSize.value * 3f).toInt().coerceAtLeast(150)
    val strokePx = bitmapPx * 0.06f

    val bitmap = buildDonutBitmap(segments, sizePx = bitmapPx, strokeWidthPx = strokePx)

    Box(
        contentAlignment = Alignment.Center,
        modifier = GlanceModifier.size(chartSize)
    ) {
        Image(
            provider = ImageProvider(bitmap),
            contentDescription = "Donut chart",
            contentScale = ContentScale.Fit,
            modifier = GlanceModifier.size(chartSize)
        )
        // Total problems in the centre
        Text(
            text = "${easy + medium + hard}",
            style = TextStyle(
                color = ColorProvider(Color(BLUE_COLOR)),
                fontSize = countFontSize,
                fontWeight = FontWeight.Bold
            )
        )
    }
}

@Composable
fun Legend(
    easy: Int,
    medium: Int,
    hard: Int,
    dotSize: Dp,
    fontSize: TextUnit
) {
    Row(
        modifier = GlanceModifier.fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Spacer(modifier = GlanceModifier.defaultWeight())
        LegendItem(color = Color(0xff00C853), count = easy, dotSize = dotSize, fontSize = fontSize)
        Spacer(modifier = GlanceModifier.defaultWeight())
        LegendItem(
            color = Color(0xffFFD600),
            count = medium,
            dotSize = dotSize,
            fontSize = fontSize
        )
        Spacer(modifier = GlanceModifier.defaultWeight())
        LegendItem(color = Color(0xffC00000), count = hard, dotSize = dotSize, fontSize = fontSize)
        Spacer(modifier = GlanceModifier.defaultWeight())
    }
}

@Composable
fun LegendItem(color: Color, count: Int, dotSize: Dp, fontSize: TextUnit) {
    Row(verticalAlignment = Alignment.Vertical.CenterVertically) {
        // Coloured circle — size scales with widget height
        Box(
            modifier = GlanceModifier
                .width(dotSize)
                .height(dotSize)
                .cornerRadius(50.dp)
                .background(color)
        ) {}
        Spacer(GlanceModifier.width(3.dp))
        Text(
            count.toString(),
            style = TextStyle(
                color = ColorProvider(Color(BLUE_COLOR)),
                fontWeight = FontWeight.Bold,
                fontSize = fontSize
            )
        )
    }
}


@Composable
fun RefreshButton() {
    Image(
        provider = ImageProvider(R.drawable.baseline_refresh_24),
        contentDescription = "Refresh",
        modifier = GlanceModifier
            .size(22.dp)
            .clickable(onClick = actionRunCallback<RefreshButtonProblems>())
    )
}


fun buildDonutBitmap(
    segments: List<ChartSegment>,
    sizePx: Int,
    strokeWidthPx: Float
): Bitmap {

    val bitmap = createBitmap(sizePx, sizePx)   // transparent ARGB_8888 bitmap
    val canvas = Canvas(bitmap)

    val paint = Paint().apply {
        isAntiAlias = true
        style = Paint.Style.STROKE       // draw only the ring, not filled
        strokeWidth = strokeWidthPx
        strokeCap = Paint.Cap.ROUND          // rounded arc ends
    }

    val pad = strokeWidthPx / 2f
    val rect = RectF(pad, pad, sizePx - pad, sizePx - pad)

    val total = segments.sumOf { it.value.toDouble() }.toFloat()

    if (total <= 0f) {
        paint.color = 0x33FFFFFF.toInt()
        canvas.drawArc(rect, -90f, 360f, false, paint)
        return bitmap
    }

    var startAngle = -90f   // -90° = 12 o'clock
    for (segment in segments) {
        if (segment.value <= 0) continue
        val sweep = (segment.value / total) * 360f
        paint.color = segment.color
        canvas.drawArc(rect, startAngle, sweep, false, paint)
        startAngle += sweep
    }

    return bitmap
}