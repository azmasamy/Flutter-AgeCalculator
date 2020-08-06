
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    Widget _generateTextField(String inputFieldText) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(inputFieldText, style: TextStyle(color: Colors.grey, fontSize: 20)),
          ),
          Theme(
            data: new ThemeData(
              primaryColor: Colors.orangeAccent,
              primaryColorDark: Colors.orange,
            ),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                suffixIcon: Icon(
                  Icons.date_range,
                  color: Colors.orange,
                ),
                hintText: '10-4-2017',
              ),
            ),
          )
        ],
      );
    }

    Widget _generateButton(String buttonName) {
      return ButtonTheme(
        minWidth: 160,
        height: 60,
        child: RaisedButton(
          color: Colors.orange,
          onPressed: () {},
          child: Text(buttonName.toUpperCase(), style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      );
    }

    Widget _generateOutputField(String fieldName){
      return Column(
        children: <Widget>[
          Container(
            color: Colors.orange,
            width: 115,
            height: 30,
            child: Center(child: Text(fieldName, style: TextStyle(color: Colors.white),)),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orange)
            ),
            width: 115,
            height: 30,
            child: Center(child: Text("", style: TextStyle(color: Colors.grey),)),
          )
        ],
      );
    }


    Widget dateOfBirth = _generateTextField("Date of Birth");
    Widget todayDate = _generateTextField("Today Date");

    Widget clearButton = _generateButton("Clear");
    Widget calcButton = _generateButton("Calculate");

    Widget years = _generateOutputField("Years");
    Widget months = _generateOutputField("Months");
    Widget days = _generateOutputField("Days");

    Widget emptyBox = SizedBox(height: 20);




    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          dateOfBirth,
          emptyBox,

          todayDate,
          emptyBox,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              clearButton,
              calcButton,
            ],
          ),
          emptyBox,

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text("Age is", style: TextStyle(fontSize: 20, color: Colors.grey),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              years,
              months,
              days,
            ],
          ),
          emptyBox,

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text("Next Birth Day in", style: TextStyle(fontSize: 20, color: Colors.grey),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              years,
              months,
              days,
            ],
          ),
        ],
      ),
    );
  }
}
