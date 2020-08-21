import 'package:age/age.dart';

class MyDate {

  int _days;
  int _months;
  int _years;

  int getDays(){
    return _days;
  }

  int getMonths(){
    return _months;
  }

  int getYears(){
    return _years;
  }

  calculateAge(DateTime _birthDate, DateTime _todayDate) {
    AgeDuration age = Age.dateDifference(
        fromDate: _birthDate, toDate: _todayDate, includeToDate: false);

    _days = age.days;
    _months = age.months;
    _years = age.years;
  }

  calculateNextBirthDay(DateTime _birthDate, DateTime _todayDate) {
    DateTime tempDate =
    DateTime(_todayDate.year, _birthDate.month, _birthDate.day);
    DateTime nextBirthdayDate = tempDate.isBefore(_todayDate)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;
    AgeDuration nextBirthdayDuration =
    Age.dateDifference(fromDate: _todayDate, toDate: nextBirthdayDate);

    _days = nextBirthdayDuration.days;
    _months = nextBirthdayDuration.months;
    _years = nextBirthdayDuration.years;
  }

}
