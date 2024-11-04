
import 'package:chartapp/controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Colors.indigo,
    Colors.indigo,
  ];

  bool showAvg = false;
  LinechartController linecontroller = Get.put(LinechartController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.40,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: LineChart(
             mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: Colors.white,
    );

    Widget monthWidget(String label, Month monthValue) {
      return Obx(() {
        return GestureDetector(
          onTap: () {
            linecontroller.activeMonth.value = monthValue;
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: linecontroller.activeMonth.value == monthValue
                  ? Colors.blue
                  : Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Text(label, style: style),
          ),
        );
      });
    }

    Widget text;
    switch (value.toInt()) {
      case 2:
        text = monthWidget('MAR', Month.mar);
        break;
      case 4:
        text = monthWidget('JUN', Month.jun);
        break;
      case 6:
        text = monthWidget('SEP', Month.sep);
        break;
      case 8:
        text = monthWidget('OCT', Month.oct);
        break;
      case 10:
        text = monthWidget('NOV', Month.nov);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 2,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white,
            strokeWidth: 2,
          );
        },
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        )
        ,
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 42,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6000,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1.4, 1200),
            FlSpot(2, 1500), // MAR
            FlSpot(4, 4000), // JUN
            FlSpot(6, 3100), // SEP
            FlSpot(8, 4000), // OCT
            FlSpot(10, 5000), // NOV
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blue],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, bar, index) {
              Month monthForSpot;
              switch (index) {
                case 1:
                  monthForSpot = Month.mar;
                  break;
                case 2:
                  monthForSpot = Month.jun;
                  break;
                case 3:
                  monthForSpot = Month.sep;
                  break;
                case 4:
                  monthForSpot = Month.oct;
                  break;
                case 5:
                  monthForSpot = Month.nov;
                  break;
                default:
                  monthForSpot = Month.notselected;
              }

              return linecontroller.activeMonth.value == monthForSpot
                  ? FlDotCirclePainter(
                      radius: 6,
                      color: Colors.blueAccent,
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                    )
                  : FlDotCirclePainter(
                      radius: 4,
                      color: Colors.transparent,
                    );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(1)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
