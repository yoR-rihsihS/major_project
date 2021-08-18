import 'package:breast_cancer_detection/widgets/benign_vs_malignant.dart';
import 'package:breast_cancer_detection/widgets/draw_table.dart';
import 'package:flutter/material.dart';

class Dataset extends StatefulWidget {
  @override
  _DatasetState createState() => _DatasetState();
}

class _DatasetState extends State<Dataset> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Container(
        height: 500,
        color: Color(0xffFFB4BC),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                flex: 11,
                child: DrawTable(
                  file: "data.json",
                  head: 'Dataset',
                  isdataset: true,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 8,
                child: PieChart1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
