import 'package:estacionamiento/date_time_picker_widget2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:estacionamiento/1/notifcation_dialog1.dart';


var tiempo1 = DateTime.parse(DateTime.now().toString());
var minutos;
var horas;
var division;
var mod=0;
var precio_hora='0';
var precio_cuarto = '0';
var acumular_cuartos = 0.toDouble();
var total;
bool enabledboton2 = false;


class DateTimePickerWidget21 extends StatefulWidget {
  @override
  _DateTimePickerWidget2State createState() => _DateTimePickerWidget2State();
}

class _DateTimePickerWidget2State extends State<DateTimePickerWidget21> {
  DateTime selectedDate1 = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        RaisedButton(
          child: Text('hora de fin: ${tiempo1.hour}:${tiempo1.minute}'),
        
          
          onPressed: () async {
            showDateTimeDialog(context, initialDate: selectedDate1,
                onselectedDate1: (selectedDate1) {
              setState(() {
                this.selectedDate1 = selectedDate1;
                
                
                
                tiempo1 = selectedDate1;
                minutos = DateTime.parse(tiempo1.toString()).difference(DateTime.parse(tiempo.toString())).inMinutes;
                horas = DateTime.parse(tiempo1.toString()).difference(DateTime.parse(tiempo.toString())).inHours;
                division = (DateTime.parse(tiempo1.toString()).difference(DateTime.parse(tiempo.toString())).inMinutes)/60;
                mod = (DateTime.parse(tiempo1.toString()).difference(DateTime.parse(tiempo.toString())).inMinutes)%60;
                if (mod==0) {
                  acumular_cuartos=0;
                } else if (mod>=1 && mod<=15) {
                  acumular_cuartos= double.parse(precio_cuarto);
                } else if (mod>=16 && mod<=30) {
                  acumular_cuartos= double.parse(precio_cuarto)*2;
                } else if (mod>=31 && mod<=45) {
                  acumular_cuartos= double.parse(precio_cuarto)*3;
                  } else if (mod>=46 && mod<=59) {
                    acumular_cuartos= double.parse(precio_cuarto)*4;
                  };
                  total = (horas * double.parse(precio_hora))+acumular_cuartos;                
                  

              });

            });
            
          },
          
        ),
        
        Text('horas: $horas'),
        Text('minutos: $mod'),
        Text('Total a pagar: $total'),
        
        
      ],
    );
  }
}
