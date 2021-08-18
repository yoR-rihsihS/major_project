import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'indicator.dart';

class GetPieChart extends StatefulWidget {
  final double trueNegative;
  final double truePositive;
  final double falseNegative;
  final double falsePositive;

  const GetPieChart(
      {required this.trueNegative,
      required this.truePositive,
      required this.falseNegative,
      required this.falsePositive});

  @override
  _GetPieChartState createState() => _GetPieChartState();
}

class _GetPieChartState extends State<GetPieChart> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        final desiredTouch =
                            pieTouchResponse.touchInput is! PointerExitEvent &&
                                pieTouchResponse.touchInput is! PointerUpEvent;
                        if (desiredTouch &&
                            pieTouchResponse.touchedSection != null) {
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        } else {
                          touchedIndex = -1;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: showingSections()),
              ),
            ),
          ),
          Indicator(
            color: Colors.greenAccent,
            text: "True Positives",
            isSquare: false,
          ),
          SizedBox(
            height: 10,
          ),
          Indicator(
            color: Colors.green,
            text: "False Positives",
            isSquare: false,
          ),
          SizedBox(
            height: 10,
          ),
          Indicator(
            color: Colors.redAccent,
            text: "True Negatives",
            isSquare: false,
          ),
          SizedBox(
            height: 10,
          ),
          Indicator(
            color: Colors.deepOrangeAccent,
            text: "False Negatives",
            isSquare: false,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: widget.trueNegative,
            title: "",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: CircleAvatar(
              backgroundColor: Colors.redAccent[100],
              child: Text("${widget.trueNegative}"),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.deepOrangeAccent,
            value: widget.falseNegative,
            title: "",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: CircleAvatar(
              backgroundColor: Colors.redAccent[100],
              child: Text("${widget.falseNegative}"),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: widget.truePositive,
            title: "",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: CircleAvatar(
              backgroundColor: Colors.greenAccent[100],
              child: Text("${widget.truePositive}"),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: widget.falsePositive,
            title: "",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: CircleAvatar(
              backgroundColor: Colors.greenAccent[100],
              child: Text("${widget.falsePositive}"),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw 'Oh no';
      }
    });
  }
}
