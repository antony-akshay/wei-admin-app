import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wei_admin/common_widgets/custom_text.dart';
import 'package:wei_admin/core/app_colors.dart';

class WeeklyBarChart extends StatelessWidget {
  final List<double> weeklyData;
  final double maxY;

  const WeeklyBarChart({Key? key, required this.weeklyData, this.maxY = 100})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 144.h,
      child: Stack(
        children: [
          // Bar Chart
          BarChart(
            BarChartData(
              maxY: maxY,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: (value, _) {
                      const days = [
                        'SUN',
                        'MON',
                        'TUE',
                        'WED',
                        'THU',
                        'FRI',
                        'SAT',
                      ];
                      return Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: CustomText(
                          text: days[value.toInt()],
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              barGroups: weeklyData.asMap().entries.map((entry) {
                final index = entry.key;
                final value = entry.value;

                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: value,
                      color: const Color(0xFF6CD68C),
                      width: 24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          // Text overlay - positioned in center of each bar
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 28,
              ), // Account for bottom titles
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final chartWidth = constraints.maxWidth;
                  final chartHeight = constraints.maxHeight;

                  final totalBarsWidth =
                      weeklyData.length * 24.w; // 24 is your bar width
                  final totalSpacing = chartWidth - totalBarsWidth;
                  final spacingBetween = totalSpacing / (weeklyData.length + 1);

                  return Stack(
                    children: weeklyData.asMap().entries.map((entry) {
                      final index = entry.key;
                      final value = entry.value;
                      final barHeight = (value / maxY) * chartHeight;

                      // Calculate exact bar center position
                      final barLeft =
                          spacingBetween + (index * (24.w + spacingBetween));
                      final barCenterX = barLeft + 12.w;

                      return Positioned(
                        left: barCenterX - 8.w, // Center horizontally
                        top:
                            chartHeight -
                            barHeight +
                            (barHeight / 2) -
                            10, // Center vertically in bar
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: CustomText(
                            text: "${value.toInt()}k",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
