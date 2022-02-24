import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'package:flutter/material.dart';

import '../../../../constants/components/components.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({Key? key}) : super(key: key);

  @override
  _DateTimeScreenState createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F8F9),
      appBar: AppBar(
        title: Text(
          'وقت التوصيل',
          style: TextStyle(
            fontFamily: 'Shamel',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DatePicker(
            DateTime.now(),
            width: 60,
            height: 80,
            controller: _controller,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.blue,
            selectedTextColor: Colors.white,

            /*inactiveDates: [
              DateTime.now().add(Duration(days: 3)),
              DateTime.now().add(Duration(days: 4)),
              DateTime.now().add(Duration(days: 7))
            ],*/
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              buildAvilableTime(time: '13:00 - 20:00'),
              buildAvilableTime(time: '13:00 - 20:00'),
              buildAvilableTime(time: '13:00 - 20:00'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultButton(text: 'حفظ', function: () {}),
          ),
        ],
      ),
    );
  }

  Widget buildAvilableTime({required String time}) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          height: 60,
          color: Colors.white,
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                  fontFamily: 'Shamel',
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
