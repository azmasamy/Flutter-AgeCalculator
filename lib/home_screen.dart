import 'package:flutter/material.dart';
import 'package:age/age.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime _birthDate, _todayDate = DateTime.now();
  int _ageYearCount,
      _ageMonthCount,
      _ageDayCount,
      _nextBirthYearCount,
      _nextBirthMonthCount,
      _nextBirthDayCount;

  @override
  Widget build(BuildContext context) {


    InputDecoration datePickerTextFieldDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
      ),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      suffixIcon: Icon(
        Icons.date_range,
        color: Colors.orange,
      ),
      hintText: '2017-04-10',
    );
    Widget birthDateTextFieldDatePicker = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('Date of Birth',
              style: TextStyle(color: Colors.grey, fontSize: 20)),
        ),
        TextField(
          showCursor: true,
          readOnly: true,
          onTap: () {
            print("TAPPED");
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1940),
                    lastDate: DateTime.now())
                .then((date) {
                  print("Then");
              setState(() {
                _birthDate = date;
                print(_birthDate);
              });
            });
          },
          controller: TextEditingController()
            ..text = (_birthDate == null
                ? ''
                : _birthDate
                    .toString()
                    .substring(0, _birthDate.toString().indexOf(' '))),
          decoration: datePickerTextFieldDecoration,
        )
      ],
    );
    Widget todayDateTextFieldDatePicker = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('Date of Birth',
              style: TextStyle(color: Colors.grey, fontSize: 20)),
        ),
        TextField(
          showCursor: true,
          readOnly: true,
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1940),
                    lastDate: DateTime.now())
                .then((date) {
              setState(() {
                _todayDate = date;
                print("Date: $date");
                print("My Date: $_todayDate");
              });
            });
          },
          controller: TextEditingController()
            ..text = (_todayDate == null
                ? ''
                : _todayDate
                    .toString()
                    .substring(0, _todayDate.toString().indexOf(' '))),
          decoration: datePickerTextFieldDecoration,
        )
      ],
    );

    Widget clearOrangeButton = ButtonTheme(
      minWidth: 160,
      height: 60,
      child: RaisedButton(
        color: Colors.orange,
        onPressed: () {
          setState(() {

            _birthDate = null;
            _todayDate = null;

            _ageYearCount = null;
            _ageMonthCount = null;
            _ageDayCount = null;

            _nextBirthYearCount = null;
            _nextBirthMonthCount = null;
            _nextBirthDayCount = null;
          });
        },
        child:
            Text('CLEAR', style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
    Widget calcOrangeButton = ButtonTheme(
      minWidth: 160,
      height: 60,
      child: RaisedButton(
        color: Colors.orange,
        onPressed: () {
          print(_todayDate);
          print(_birthDate);
          AgeDuration age = Age.dateDifference(fromDate: _birthDate, toDate: _todayDate, includeToDate: false);
          DateTime tempDate = DateTime(_todayDate.year, _birthDate.month, _birthDate.day);
          DateTime nextBirthdayDate = tempDate.isBefore(_todayDate)
              ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
              : tempDate;
          AgeDuration nextBirthdayDuration =
          Age.dateDifference(fromDate: _todayDate, toDate: nextBirthdayDate);
          setState(() {
            _ageYearCount = age.years;
            _ageMonthCount = age.months;
            _ageDayCount = age.days;

            _nextBirthYearCount = nextBirthdayDuration.years;
            _nextBirthMonthCount = nextBirthdayDuration.months;
            _nextBirthDayCount = nextBirthdayDuration.days;
          });
        },
        child:
            Text('CALCULATE', style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
    Widget buttonsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        clearOrangeButton,
        calcOrangeButton,
      ],
    );

    Widget ageYearsOutputField = Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            'Years',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            _ageYearCount == null ? "" : "$_ageYearCount",
            style: TextStyle(color: Colors.grey),
          )),
        )
      ],
    );
    Widget ageMonthsOutputField = Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            'Months',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            _ageMonthCount == null ? "" : "$_ageMonthCount",
            style: TextStyle(color: Colors.grey),
          )),
        )
      ],
    );
    Widget ageDaysOutputField = Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            "Days",
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            _ageDayCount == null ? "" : "$_ageDayCount",
            style: TextStyle(color: Colors.grey),
          )),
        )
      ],
    );
    Widget ageOutputRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ageYearsOutputField,
        ageMonthsOutputField,
        ageDaysOutputField,
      ],
    );

    Widget nextBirthYearsOutputField = Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            'Years',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            _nextBirthYearCount == null ? "" : "$_nextBirthYearCount",
            style: TextStyle(color: Colors.grey),
          )),
        )
      ],
    );
    Widget nextBirthMonthsOutputField = Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            'Months',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            _nextBirthMonthCount == null ? "" : "$_nextBirthMonthCount",
            style: TextStyle(color: Colors.grey),
          )),
        )
      ],
    );
    Widget nextBirthDaysOutputField = Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            "Days",
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            _nextBirthDayCount == null ? "" : "$_nextBirthDayCount",
            style: TextStyle(color: Colors.grey),
          )),
        )
      ],
    );
    Widget nextBirthOutputRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        nextBirthYearsOutputField,
        nextBirthMonthsOutputField,
        nextBirthDaysOutputField,
      ],
    );

    Widget emptyBox = SizedBox(height: 20);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            birthDateTextFieldDatePicker,
            emptyBox,
            todayDateTextFieldDatePicker,
            emptyBox,
            buttonsRow,
            emptyBox,
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Age is",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            ageOutputRow,
            emptyBox,
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Next Birth Day in",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            nextBirthOutputRow,
          ],
        ),
      ),
    );
  }
}
