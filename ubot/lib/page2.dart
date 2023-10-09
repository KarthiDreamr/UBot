import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ucare/Components/custom_card_text.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 34, right: 2),
          child: CustomBarChart(),
          // VerticalChart()
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomCardText(
                    textValue: "\n\u2756 Corrosion"
                        "\n\u2756 cavitation "
                        "\n\u2756 erosion"
                        "\n\u2756 fatigue"
                        "\n\u2756 material defect due to aging"
                        "\n\u2756 Excession vibration of the turbines"
                        "\n\u2756 abrasion",
                    headingValue: "Problems",
                    isTop: true),
                CustomCardText(
                    textValue: "\n\u2756 Water pressure, water flow"
                        "\n\u2756 Salinity "
                        "\n\u2756 Cloudy or foul-smelling urine"
                        "\n\u2756 Chemicals present in the water"
                        "\n\u2756 biofouling (accumulation of the marine life on structures)"
                        "\n\u2756 Temperature of the water"
                        "\n\u2756 water levels",
                    headingValue: "Environmental conditions",
                    isTop: true),

                /*
                *Problems:
1.	Corrosion
2.	cavitation
3.	erosion
4.	fatigue
5.	material defect due to aging, Excession vibration of the turbines
6.	abrasion
Environmental conditions:
1.	Water pressure, water flow
2.	Salinity
3.	Chemicals present in the water
4.	biofouling (accumulation of the marine life on structures)
5.	Temperature of the water
6.	water levels
7.	habitants
                * */
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        // barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        // gridData: gridData,
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
        minY: 0,
      ),
    );
  }

  FlBorderData get borderData => FlBorderData(
    border: const Border(
      left: BorderSide(color: Colors.black, width: 1),
      bottom: BorderSide(color: Colors.black, width: 1),
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 13.5,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'PH';
        break;
      case 1:
        text = 'Hydration';
        break;
      case 2:
        text = 'Color';
        break;
      case 3:
        text = 'Health';
        break;
      case 4:
        text = 'Density';
        break;
      case 5:
        text = 'Death';
        break;
      case 6:
        text = 'Mental';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,

      ),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          interval: 25
      ),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  //
  // LinearGradient get _barsGradient => const LinearGradient(
  //       colors: [
  //         Colors.red,
  //         Colors.orange,
  //         Colors.green,
  //       ],
  //       begin: Alignment.bottomCenter,
  //       end: Alignment.topCenter,
  //     );


  LinearGradient get _barsGradient => const LinearGradient(
    colors: [
      Colors.red,
      Colors.orange,
      Colors.green,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [

    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: 70,
          gradient: const LinearGradient(
            colors: [
              Colors.red,
              Colors.orange,
              Colors.green,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        )
      ],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          toY: 96,
          gradient: _barsGradient,
        )
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          toY: 85,
          gradient: _barsGradient,
        )
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: 79,
          gradient: _barsGradient,
        )
      ],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: 100,
          gradient: _barsGradient,
        )
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          toY: 79,
          gradient: _barsGradient,
        )
      ],
    ),

  ];
}

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.4,
      child: _BarChart(),
    );
  }
}
