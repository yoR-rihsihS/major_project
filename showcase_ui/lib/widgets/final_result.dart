import 'package:breast_cancer_detection/widgets/draw_table.dart';
import 'package:flutter/material.dart';

class FinalResult extends StatefulWidget {
  @override
  _FinalResultState createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
      child: Container(
          color: Color(0xffFFB4BC),
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Card(
                    color: Colors.white,
                    child: Image.asset('roc.png'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 11,
                  child: DrawTable(
                    file: 'comparison.json',
                    head: 'Results',
                    isdataset: true,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
