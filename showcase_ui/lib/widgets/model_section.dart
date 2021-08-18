import 'package:breast_cancer_detection/utils/model.dart';
import 'package:breast_cancer_detection/widgets/draw_table.dart';
import 'package:breast_cancer_detection/widgets/get_pie_chart.dart';
import 'package:flutter/material.dart';

class MLModel extends StatefulWidget {
  @override
  _MLModelState createState() => _MLModelState();
}

class _MLModelState extends State<MLModel> {
  Model model = Model.logistic_regression;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xffFFCECE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Model>(
                focusColor: Colors.white,
                iconEnabledColor: Colors.white,
                dropdownColor: Color(0xffFFCECE),
                value: model,
                onChanged: (Model? newValue) {
                  setState(() {
                    model = newValue!;
                  });
                },
                items: Model.values.map((Model model) {
                  return DropdownMenuItem<Model>(
                    value: model,
                    child: Text(
                      model.toString().split('.').last.replaceAll('_', ' '),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 500,
            color: Color(0xffFFB4BC),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(flex: 11, child: showResultsTable()),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 8,
                    child: showChart(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showChart() {
    switch (model) {
      case Model.logistic_regression:
        return GetPieChart(
            trueNegative: 66,
            truePositive: 46,
            falseNegative: 1,
            falsePositive: 1);
      case Model.support_vector_machine:
        return GetPieChart(
            trueNegative: 66,
            truePositive: 46,
            falseNegative: 1,
            falsePositive: 1);
      case Model.k_nearest_neighbor:
        return GetPieChart(
            trueNegative: 67,
            truePositive: 44,
            falseNegative: 3,
            falsePositive: 0);
      case Model.naive_bayes:
        return GetPieChart(
            trueNegative: 64,
            truePositive: 41,
            falseNegative: 6,
            falsePositive: 3);
      case Model.decision_tree:
        return GetPieChart(
            trueNegative: 65,
            truePositive: 46,
            falseNegative: 1,
            falsePositive: 2);
      case Model.random_forest:
        return GetPieChart(
            trueNegative: 66,
            truePositive: 45,
            falseNegative: 2,
            falsePositive: 1);
    }
  }

  Widget showResultsTable() {
    switch (model) {
      case Model.logistic_regression:
        return DrawTable(
          file: 'lr.json',
          head: 'Logistic Regression Results',
          isdataset: false,
        );
      case Model.support_vector_machine:
        return DrawTable(
          file: 'svm.json',
          head: 'Support Vector Machine Results',
          isdataset: false,
        );
      case Model.k_nearest_neighbor:
        return DrawTable(
          file: 'knn.json',
          head: 'K-Nearest Neighbor Results',
          isdataset: false,
        );
      case Model.naive_bayes:
        return DrawTable(
          file: 'nb.json',
          head: 'Naive Bayes Results',
          isdataset: false,
        );
      case Model.decision_tree:
        return DrawTable(
          file: 'dt.json',
          head: 'Decision Tree Results',
          isdataset: false,
        );
      case Model.random_forest:
        return DrawTable(
          file: 'rf.json',
          head: 'Random Forest Results',
          isdataset: false,
        );
    }
  }
}
