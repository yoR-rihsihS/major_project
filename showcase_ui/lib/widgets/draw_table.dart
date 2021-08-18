import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_table/json_table.dart';

class DrawTable extends StatefulWidget {
  final String file;
  final String head;
  final bool isdataset;

  const DrawTable(
      {required this.file, required this.head, required this.isdataset});

  @override
  _DrawTableState createState() => _DrawTableState();
}

class _DrawTableState extends State<DrawTable> {
  List file = [];

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString(widget.file);
    final data = await json.decode(jsonText);
    setState(() {
      file = data;
    });
  }

  @override
  void didUpdateWidget(covariant DrawTable oldWidget) {
    loadJsonData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            widget.head,
            style: TextStyle(
              fontSize: 40,
              color: Color(0xffFF96A7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: file.length == 0
                ? Container()
                : JsonTable(
                    file,
                    paginationRowCount: 10,
                    tableHeaderBuilder: (header) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Color(0xffFFCECE),
                        ),
                        child: Text(
                          header!.replaceAll('_', ' '),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                              color: Colors.black87),
                        ),
                      );
                    },
                    tableCellBuilder: (value) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: Colors.blueAccent.withOpacity(0.5))),
                        child: Text(
                          widget.isdataset
                              ? value
                              : value == "1"
                                  ? "Malignant"
                                  : "Benign",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[900],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
