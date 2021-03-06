import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import 'chart.dart';

import '../utils/constants.dart';

import '../models/country_summary.dart';
import '../models/time_series_cases.dart';

class CountryStatistics extends StatelessWidget {

  final List<CountrySummaryModel> summaryList;

  CountryStatistics({@required this.summaryList});
  final formatter = new NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        children: <Widget>[

          buildCard(
            "CONFIRMED",
            summaryList[summaryList.length - 1].confirmed,
            kConfirmedColor,
            "ACTIVE",
            summaryList[summaryList.length - 1].active,
            kActiveColor,
          ),
        
          buildCard(
            "RECOVERED",
            summaryList[summaryList.length - 1].recovered,
            kRecoveredColor,
            "DEATH",
            summaryList[summaryList.length - 1].death,
            kDeathColor,
          ),

          buildCardChart(summaryList),

        ],
      ),
    );
  }

  Widget buildCard(String leftTitle, int leftValue, Color leftColor, String rightTitle, int rightValue, Color rightColor){
    return SingleChildScrollView(
          child: Card(margin: EdgeInsets.only(right:1,left:1,top: 1,bottom: 0),
        elevation: 1.5,
        color: Colors.white.withOpacity(0.7),
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),),
        child: Container(
          height: 100,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
         width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      leftTitle,
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    Expanded(
                      child: Container(),
                    ),

                    Text(
                      "Total",
                      style: TextStyle(
                        color: leftColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      formatter.format(leftValue),
                      style: TextStyle(
                        color: leftColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[

                  Text(
                    rightTitle,
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                  Expanded(
                    child: Container(),
                  ),

                   Text(
                    "Total",
                    style: TextStyle(
                      color: rightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),

                  Text(
                     formatter.format(rightValue),
                    style: TextStyle(
                      color: rightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardChart(List<CountrySummaryModel> summaryList){
    return SingleChildScrollView(
          child: Card(color: Colors.white.withOpacity(0.7),
         shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),),
        elevation: 1,
        child: Container(
          height: 190,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Chart(
            _createData(summaryList),
            animate: false,
          ),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, DateTime>> _createData(List<CountrySummaryModel> summaryList) {

    List<TimeSeriesCases> confirmedData = [];
    List<TimeSeriesCases> activeData = [];
    List<TimeSeriesCases> recoveredData = [];
    List<TimeSeriesCases> deathData = [];

    for (var item in summaryList) {
      confirmedData.add(TimeSeriesCases(item.date, item.confirmed));
      activeData.add(TimeSeriesCases(item.date, item.active));
      recoveredData.add(TimeSeriesCases(item.date, item.recovered));
      deathData.add(TimeSeriesCases(item.date, item.death));
    }

    return [      
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Confirmed',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kConfirmedColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: confirmedData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Active',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kActiveColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: activeData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Recovered',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecoveredColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: recoveredData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Death',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor),
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: deathData,
      ),
      
    ];
  }

}