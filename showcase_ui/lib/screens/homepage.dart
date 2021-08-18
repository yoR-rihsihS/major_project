import 'package:breast_cancer_detection/widgets/cover.dart';
import 'package:breast_cancer_detection/widgets/dataset_section.dart';
import 'package:breast_cancer_detection/widgets/final_result.dart';
import 'package:breast_cancer_detection/widgets/model_section.dart';
import 'package:breast_cancer_detection/widgets/show_diagram.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Cover(),
            Dataset(),
            ShowDiagram(),
            MLModel(),
            FinalResult(),
          ],
        ),
      ),
    );
  }
}
