import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  String _inputTitle;

  TextFieldWidget(this._inputTitle);

  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<TextFieldWidget> {
  DateTime _inputText;
  String _inputTitle;

  @override
  void initState() {
    // TODO: implement initState
    _inputTitle = widget._inputTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('$_inputTitle',
              style: TextStyle(color: Colors.grey, fontSize: 20)),
        ),
        TextField(
          onTap: (){
            showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now()
            ).then((date){
              setState(() {
                _inputText = date;
              });
            });
          },
          controller: TextEditingController()
            ..text = (_inputText == null ? '' : _inputText.toString().substring(0, _inputText.toString().indexOf(' '))),
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
        )
      ],
    );
  }
}
