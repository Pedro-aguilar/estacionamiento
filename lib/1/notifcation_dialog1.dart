import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'costos.dart';


Future<TimeOfDay> _selectTime(BuildContext context,
    {@required DateTime initialDate}) {
  

  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: initialDate.hour, minute: initialDate.minute),
  );
}

Future<DateTime> _selectDateTime(BuildContext context,
    {@required DateTime initialDate}) {
  final now = DateTime.now();
  final newestDate = initialDate.isAfter(now) ? initialDate : now;

  return showDatePicker(
    context: context,
    initialDate: newestDate.add(Duration(seconds: 1)),
    firstDate: now,
    lastDate: DateTime(2100),
  );
}

Dialog showDateTimeDialog(
  BuildContext context, {
  @required ValueChanged<DateTime> onselectedDate1,
  @required DateTime initialDate,
}) {
  final dialog = Dialog(
    child: DateTimeDialog(
        onselectedDate1: onselectedDate1, initialDate: initialDate),
  );

  showDialog(context: context, builder: (BuildContext context) => dialog);
}

class DateTimeDialog extends StatefulWidget {
  
  final ValueChanged<DateTime> onselectedDate1;
  final DateTime initialDate;

  const DateTimeDialog({
    @required this.onselectedDate1,
    @required this.initialDate,
    Key key,
  }) : super(key: key);
  @override
  _DateTimeDialogState createState() => _DateTimeDialogState();
}

class _DateTimeDialogState extends State<DateTimeDialog> {
  DateTime selectedDate1;

  

  @override
  void initState() {
    super.initState();

    selectedDate1 = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '',
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(DateFormat('yyyy-MM-dd').format(selectedDate1)),
                  onPressed: () async {
                    final date = await _selectDateTime(context,
                        initialDate: selectedDate1);
                    if (date == null) return;

                    setState(() {
                      selectedDate1 = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        selectedDate1.hour,
                        selectedDate1.minute,
                      );
                    });

                    widget.onselectedDate1(selectedDate1);
                  },
                ),
                
                const SizedBox(width: 8),
                RaisedButton(
                  child: Text(DateFormat('HH:mm').format(selectedDate1)),
                  onPressed: () async {
                    final time =
                        await _selectTime(context, initialDate: selectedDate1);
                    if (time == null) return;
                    

                    setState(() {
                      selectedDate1 = DateTime(
                        selectedDate1.year,
                        selectedDate1.month,
                        selectedDate1.day,
                        time.hour,
                        time.minute,
                      );
                      
                      
                      

                    });

                    widget.onselectedDate1(selectedDate1);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            OutlineButton(
              child: Text('cambiar!'),
              onPressed: () {
                setState(() {
                  
                          });
                Navigator.of(context).pop();
                enabled = false;
                  
              },
              highlightColor: Colors.orange,
            ),
          ],
        ),
      );
}
