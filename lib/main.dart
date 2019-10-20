import 'package:estacionamiento/1/costos.dart';
import 'package:estacionamiento/1/date_time_picker_widget21.dart';
import 'package:flutter/material.dart';
import 'package:estacionamiento/date_time_picker_widget2.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Calcula el pago por el estacionamiento';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatelessWidget {
  final String appTitle;
 
  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Costos(),
              DateTimePickerWidget2(),
              DateTimePickerWidget21(),
              
            
              
              

            ],
          )
        )
        ,
      );
}
