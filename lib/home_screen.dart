import 'package:flutter/material.dart';
import 'application_logic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _birthDate, _todayDate = DateTime.now();

  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _todayDateController = TextEditingController();

  int _ageYearCount,
      _ageMonthCount,
      _ageDayCount,
      _nextBirthYearCount,
      _nextBirthMonthCount,
      _nextBirthDayCount;

  @override
  Widget build(BuildContext context) {
    Widget _dateOfBirthHeading = _buildHeading("Date of Birth");
    Widget _birthDateTextFieldDatePicker = _buildBirthDateTextFieldDatePicker();

    Widget _todayDateHeading = _buildHeading("Today Date");
    Widget _todayDateTextFieldDatePicker = _buildTodayDateTextFieldDatePicker();

    Widget _clearCalcButtonsRow = _buildClearCalcButtonsRow();

    Widget _ageOutputHeading = _buildHeading("Age is");
    Widget _ageOutputRow = _buildAgeOutputRow();

    Widget _nextBirthDayHeading = _buildHeading("Next Birth Day in");
    Widget _nextBirthOutputRow = _buildNextBirthDayOutputRow();

    Widget _emptyBox = SizedBox(height: 20);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _dateOfBirthHeading,
            _birthDateTextFieldDatePicker,
            _emptyBox,
            _todayDateHeading,
            _todayDateTextFieldDatePicker,
            _emptyBox,
            _clearCalcButtonsRow,
            _emptyBox,
            _ageOutputHeading,
            _ageOutputRow,
            _emptyBox,
            _nextBirthDayHeading,
            _nextBirthOutputRow,
          ],
        ),
      ),
    );
  }

  Widget _buildOutputField(String outputTitle, String outputData) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.orange,
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            outputTitle,
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            outputData == "null" ? "" : outputData,
            style: TextStyle(color: Colors.grey),
          )),
        )
      ],
    );
  }

  Widget _buildHeading(String headingTitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        headingTitle,
        style: TextStyle(fontSize: 20, color: Colors.grey),
      ),
    );
  }

  InputDecoration _buildTextFieldDecoration() {
    return InputDecoration(
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
  }

  Widget _buildBirthDateTextFieldDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
                _birthDate = date;
               _dateOfBirthController.text = _getFormattedDate(_birthDate);
              });
            });
          },
          controller: _dateOfBirthController,
          decoration: _buildTextFieldDecoration(),
        )
      ],
    );
  }

  Widget _buildTodayDateTextFieldDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
                _todayDateController.text = _getFormattedDate(_todayDate);
              });
            });
          },
          controller: _todayDateController..text = _getFormattedDate(_todayDate),
          decoration: _buildTextFieldDecoration(),
        )
      ],
    );
  }

  Widget _buildClearOrangeButton() {
    return ButtonTheme(
      minWidth: 160,
      height: 60,
      child: RaisedButton(
        color: Colors.orange,
        onPressed: () {
          setState(() {
            _birthDate = null;
            _dateOfBirthController.text = _getFormattedDate(_birthDate);

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
  }

  Widget _buildCalcOrangeButton() {
    return ButtonTheme(
      minWidth: 160,
      height: 60,
      child: RaisedButton(
        color: Colors.orange,
        onPressed: () {
          MyDate age = new MyDate();
          MyDate nextBirthdayDuration = new MyDate();

          age.calculateAge(_birthDate, _todayDate);
          nextBirthdayDuration.calculateNextBirthDay(_birthDate, _todayDate);

          setState(() {
            _ageYearCount = age.getYears();
            _ageMonthCount = age.getMonths();
            _ageDayCount = age.getDays();

            _nextBirthYearCount = nextBirthdayDuration.getYears();
            _nextBirthMonthCount = nextBirthdayDuration.getMonths();
            _nextBirthDayCount = nextBirthdayDuration.getDays();
          });
        },
        child: Text('CALCULATE',
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  Widget _buildClearCalcButtonsRow() {
    Widget _clearOrangeButton = _buildClearOrangeButton();
    Widget _calcOrangeButton = _buildCalcOrangeButton();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _clearOrangeButton,
        _calcOrangeButton,
      ],
    );
  }

  Widget _buildAgeOutputRow() {
    Widget _ageYearsOutputField =
        _buildOutputField("Years", _ageYearCount.toString());
    Widget _ageMonthsOutputField =
        _buildOutputField("Months", _ageMonthCount.toString());
    Widget _ageDaysOutputField =
        _buildOutputField("Days", _ageDayCount.toString());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _ageYearsOutputField,
        _ageMonthsOutputField,
        _ageDaysOutputField,
      ],
    );
  }

  Widget _buildNextBirthDayOutputRow() {
    Widget _nextBirthYearsOutputField =
        _buildOutputField("Years", _nextBirthYearCount.toString());
    Widget _nextBirthMonthsOutputField =
        _buildOutputField("Months", _nextBirthMonthCount.toString());
    Widget _nextBirthDaysOutputField =
        _buildOutputField("Days", _nextBirthDayCount.toString());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _nextBirthYearsOutputField,
        _nextBirthMonthsOutputField,
        _nextBirthDaysOutputField,
      ],
    );
  }

  String _getFormattedDate(DateTime date) {
    return (date == null
        ? ''
        : date
        .toString()
        .substring(0, date.toString().indexOf(' ')));
  }
}
