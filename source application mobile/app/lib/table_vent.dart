
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class tableVent extends StatefulWidget {
  const tableVent({Key? key}) : super(key: key);

  @override
  State<tableVent> createState() => _tableVentState();
}

class _tableVentState extends State<tableVent> {
  DateTime? selectedDate;
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse(
      // Replace the URL with your data source endpoint
      "https://script.google.com/macros/s/AKfycbxsWio24I3tfyCVwlPFRqJQdq5IiTawzmqFIQ98GjdGHB9fyzWDVZmGcW5uNKfWBY-xAA/exec",
    ));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List<dynamic>;
      List<Map<String, dynamic>> dataList = [];
      for (int i = 0; i < jsonResponse.length; i++) {
        final dateAj = jsonResponse[i]['date'].toString();
        final timestamp = DateTime.parse(dateAj);
        final formattedTimestamp = DateFormat('yyyy-MM-dd').format(timestamp);
        final formattedTime = DateFormat('HH:mm:ss').format(timestamp);

        dataList.add({
          'vent': jsonResponse[i]['vent'].toString(),
          'date': formattedTimestamp, // Store formatted date for sorting
          'time': formattedTime,
        });
      }

      setState(() {
        _data = dataList;
      });
    }
  }

  List<DataRow> filterDataByDate(DateTime? date) {
    List<DataRow> filteredRows = [];

    for (var row in _data) {
      final rowDate = DateTime.parse(row['date']);
      if (rowDate == date) {
        filteredRows.add(DataRow(
          cells: [
            DataCell(Text(row['vent'].toString(),style: TextStyle(fontSize: 16),)),
            DataCell(Text(row['date'].toString(),style: TextStyle(fontSize: 16),)),
            DataCell(Text(row['time'].toString(),style: TextStyle(fontSize: 16),)),
          ],
        ));
      }
    }

    return filteredRows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Historiques de vent'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                // Date picker
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan)),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null && picked != selectedDate) {
                      setState(() {
                        selectedDate = picked;
                      });

                    }
                  },
                  child: Text(selectedDate != null
                      ? 'date sélectionnée: ${selectedDate.toString().substring(0, 10)}'
                      : 'sélectionner une date',style: TextStyle(fontSize: 20),),
                ),
                // DataTable
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: selectedDate != null
                        ? filterDataByDate(selectedDate).isEmpty
                        ? Center(
                      child: Text('No data found.',style: TextStyle(fontSize: 30),),
                    )
                        : DataTable(
                      columns: const [
                        DataColumn(label: Text('vitsse de vent',style: TextStyle(fontSize: 20),)),
                        DataColumn(label: Text('Date',style: TextStyle(fontSize: 20),)),
                        DataColumn(label: Text('Time',style: TextStyle(fontSize: 20),)),
                      ],
                      rows: filterDataByDate(selectedDate),
                    )
                        : _data.isEmpty
                        ? Center(
                      child: Text('Attendez...',style: TextStyle(fontSize: 20),),
                    )
                        : DataTable(
                      columns: const [
                        DataColumn(label: Text('vent ',style: TextStyle(fontSize: 20),)),
                        DataColumn(label: Text('Date',style: TextStyle(fontSize: 20),)),
                        DataColumn(label: Text('Time',style: TextStyle(fontSize: 20),)),
                      ],
                      rows: _data.map((jsonResponse) {
                        return DataRow(cells: [
                          DataCell(Text(jsonResponse['vent'].toString(),style: TextStyle(fontSize: 16),)),
                          DataCell(Text(jsonResponse['date'].toString(),style: TextStyle(fontSize: 16),)),
                          DataCell(Text(jsonResponse['time'].toString(),style: TextStyle(fontSize: 16),)),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
