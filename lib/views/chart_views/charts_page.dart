import 'package:flutter/material.dart';
import 'package:shield_box/views/chart_views/chart_week_view.dart';
import 'package:shield_box/views/chart_views/chart_current_view.dart';
import 'package:shield_box/colors.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerColor,
        title: const Text(
          "ShieldBox",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
          ),
        ),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      backgroundColor: backGroundColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ChartCurrentView(
              chartbarheight: 25.8,
              containerheight: 500,
            ),
            ChartWeekView(
              text: "Last Week Temperature",
            ),
          ],
        ),
      ),
    );
  }
}
