import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:estacionamiento/notifcation_dialog.dart';

bool enabledboton1 = false;

var tiempo = DateTime.parse(DateTime.now().toString());

class DateTimePickerWidget2 extends StatefulWidget {
  @override
  _DateTimePickerWidget2State createState() => _DateTimePickerWidget2State();
}

class _DateTimePickerWidget2State extends State<DateTimePickerWidget2> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('hora de inicio: ${tiempo.hour}:${tiempo.minute}'),
          onPressed: () async {
            showDateTimeDialog(context, initialDate: selectedDate,
                onSelectedDate: (selectedDate) {
              setState(() {
                this.selectedDate = selectedDate;

                tiempo = selectedDate;
              });
            });
          },
        ),
      ],
    );
  }
}
