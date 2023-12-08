import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'circleprogress.dart';

class dht extends StatefulWidget {
  static const screenRoute = '/page3' ;
  const dht({super.key});

  @override
  State<dht> createState() => _dhtState();
}

class _dhtState extends State<dht> with TickerProviderStateMixin {
  final databaseReference = FirebaseDatabase.instance.ref();
  double temperature = 0 ;
  double humidity = 0;
  bool isLoading = false;

  late AnimationController progressController ;
  late AnimationController tempAnimationController;
  late Animation<double> tempAnimation;

  late AnimationController humAnimationController;
  late Animation<double> humAnimation;
  List<SalesData> sales = [];
  List<String>months=['april,','jun','july'];
  List<int>salescount=[150,200,450];
  void loadsales() {
    /*sales = [
      SalesData('1950', 200),
      SalesData('1960', 400),
      SalesData('1970', 600),
      SalesData('1980', 800),
      SalesData('1990', 1000),
    ];*/
    for(int i=0 ;i<months.length;i++){
      sales.add(SalesData(months[i], salescount[i]));
    }
  }

  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    databaseReference.child('esp').onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          temperature = data['temp']?.toDouble() ?? 0.0;
          humidity = data['ha']?.toDouble() ?? 0.0;
          isLoading = true ;
          tempAnimationController = AnimationController(
            vsync: this,
            duration: Duration(seconds: 1),
          );
          tempAnimation =
          Tween<double>(begin: 0, end: temperature).animate(progressController)
            ..addListener(() {
              setState(() {});
            });
          humAnimationController = AnimationController(
            vsync: this,
            duration: Duration(seconds: 1),
          );
          humAnimation =
          Tween<double>(begin: 0, end: humidity).animate(progressController)
            ..addListener(() {
              setState(() {});
            });
          progressController.forward(); }
        );} }
    );
    tempAnimation =
    Tween<double>(begin: -100, end: temperature).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    humAnimation =
    Tween<double>(begin: -100, end: humidity).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
    progressController.forward();
    loadsales();


  }
  @override
  void dispose() {
    // Dispose the AnimationControllers when they are no longer needed
    tempAnimationController.dispose();
    humAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Text("DHT Measurment"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:Container(
              margin: const EdgeInsets.only(left: 24,right: 24),
              child: isLoading? Column(

                  children: [
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 250,
                            width: 200,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child:
                            Column(
                              children:[

                                Text(
                                  'Temperature: ',
                                ),



                                CustomPaint(
                                  foregroundPainter:
                                  CircleProgress(tempAnimation.value, true),
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          /*Text(
              'Temperature: ',
           ),*/
                                          Text(
                                            '${tempAnimation.value.toInt()}',
                                            style: TextStyle(
                                                fontSize: 50, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '°C',
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),



                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Container(
                            height: 250,
                            width: 200,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child:
                            Column(
                              children:[

                                Text(
                                  'humidity: ',
                                ),


                                CustomPaint(
                                  foregroundPainter:
                                  CircleProgress(humAnimation.value, false),
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Humidity: ',
                                          ),
                                          Text(
                                            '${humAnimation.value.toInt()}',
                                            style: TextStyle(
                                                fontSize: 50, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '%',
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],


                            ),



                          ),
                        ),
                      ],


                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child:SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            series: <ChartSeries>[
                              LineSeries<SalesData, String>(
                                dataSource: sales,
                                xValueMapper: (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => sales.sales,)
                            ]) ,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.all(8.0),
                      ),
                    )]
              ):const Text(
                'Loading...',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
          ),
        ),
      ),
    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}






