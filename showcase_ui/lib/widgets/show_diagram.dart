import 'package:breast_cancer_detection/utils/diagram.dart';
import 'package:breast_cancer_detection/utils/histogram.dart';
import 'package:flutter/material.dart';

class ShowDiagram extends StatefulWidget {
  @override
  _ShowDiagramState createState() => _ShowDiagramState();
}

class _ShowDiagramState extends State<ShowDiagram> {
  Diagram diagram = Diagram.histogram;
  Histogram histogram = Histogram.area_mean;

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
              child: DropdownButton<Diagram>(
                focusColor: Colors.white,
                iconEnabledColor: Colors.white,
                dropdownColor: Color(0xffFFCECE),
                value: diagram,
                onChanged: (Diagram? newValue) {
                  setState(() {
                    diagram = newValue!;
                  });
                },
                items: Diagram.values.map((Diagram model) {
                  return DropdownMenuItem<Diagram>(
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
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: showText(),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 11,
                    child: showImage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showImage() {
    switch (diagram) {
      case Diagram.pair_plot:
        return Card(
          color: Colors.white,
          child: Image.asset('pairplot.png'),
        );
      case Diagram.histogram:
        return Card(
          color: Colors.white,
          child: Image.asset("${histogram.toString().split('.').last}.png"),
        );
      case Diagram.correlation:
        return Card(
          child: Image.asset('heatmap.png'),
          color: Colors.white,
        );
    }
  }

  Widget showText() {
    switch (diagram) {
      case Diagram.pair_plot:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pair Plot",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "A pairs plot allows us to see both distribution of single variables and relationships between two variables.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        );
      case Diagram.correlation:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Correlation",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Correlation is a statistical measure that indicates the extent to which two or more variables fluctuate together. Higher the correlation value between a dependent variable and an independent variable, higher the significance of that independent variable in determining the dependent variable.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        );
      case Diagram.histogram:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Histogram",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "A histogram is a graphical representation that organizes a group of data points into specified ranges called as bins.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xffFFCECE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Histogram>(
                    focusColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    dropdownColor: Color(0xffFFCECE),
                    value: histogram,
                    onChanged: (Histogram? newValue) {
                      setState(() {
                        histogram = newValue!;
                      });
                    },
                    items: Histogram.values.map((Histogram model) {
                      return DropdownMenuItem<Histogram>(
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
            ),
          ],
        );
    }
  }
}
