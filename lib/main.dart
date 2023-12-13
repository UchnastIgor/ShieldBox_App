import 'package:flutter/material.dart';
import 'package:shield_box/models/user_cubit.dart';
import 'package:shield_box/models/user_models.dart';
import 'package:shield_box/views/auth_view/start_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:notepad_frontend/models/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(User()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const StartView(),
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 13, 10, 27),
//           title: Text(
//             "ShieldBox",
//             style: TextStyle(
//               color: Colors.blue,
//               fontSize: 30,
//             ),
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 13, 10, 27),
//         body: SingleChildScrollView(
//           child: Column(
//             children: const [
//               ChartCurrentView(
//                 chartbarheight: 25.8,
//               ),
//               // ChartTempView(text: "Aktualna Temperatura"),
//               ChartWeekView(
//                 text: "Last Week Temperature",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChartPage extends StatefulWidget {
//   const ChartPage({super.key});

//   @override
//   State<ChartPage> createState() => _ChartPageState();
// }

// class _ChartPageState extends State<ChartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: LineChart(
//           LineChartData(
//             lineBarsData: [
//               LineChartBarData(
//                 spots: const [
//                   FlSpot(0, 3),
//                   FlSpot(1, 4),
//                   FlSpot(2, 5),
//                   FlSpot(3, 2),
//                   FlSpot(4, 5),
//                 ],
//                 isCurved: true,
//                 dotData: FlDotData(
//                   show: true,
//                 ),
//                 color: Colors.black,
//                 barWidth: 2,
//                 belowBarData: BarAreaData(
//                   show: true,
//                   color: Colors.yellow,
//                 ),
//               ),
//             ],
//             minX: 0,
//             minY: 0,
//             maxX: 40,
//             maxY: 10,
//             backgroundColor: Colors.black12,
//             titlesData: FlTitlesData(
//               show: true,
//               bottomTitles: AxisTitles(
//                 axisNameWidget: const Text("Days of the week"),
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 50,
//                   interval: 4,
//                   getTitlesWidget: (value, meta) {
//                     String text = '';
//                     switch (value.toInt()) {
//                       case 0:
//                         text = "monday";
//                         break;
//                       case 6:
//                         text = "tuesday";
//                         break;
//                       case 12:
//                         text = "wednesday";
//                         break;
//                       case 18:
//                         text = "thursday";
//                         break;
//                       case 24:
//                         text = "friday";
//                         break;
//                       case 30:
//                         text = "saturday";
//                         break;
//                       case 36:
//                         text = "sunday";
//                         break;
//                     }
//                     return Text(text);
//                   },
//                 ),
//               ),
//               leftTitles: AxisTitles(
//                 axisNameWidget: const Text("Temperature"),
//                 sideTitles: SideTitles(showTitles: true, reservedSize: 30),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
