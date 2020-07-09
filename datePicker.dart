import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        brightness:Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF212121),
        accentColor: const Color(0xFF64ffda),
        canvasColor: const Color(0xFF303030),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime _selectedTime;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),

      body:
        Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Future<DateTime> selectedDate = showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2030),
                    builder: (BuildContext context, Widget child){
                      return Theme(
                        data: ThemeData.dark(),
                        child: child,
                      );
                    },
                );
                //여기서 사용자가 선택할 때까지 코드가 블록됨

                selectedDate.then((dateTime){
                  setState(() {
                    _selectedTime = dateTime;
                  });
                });
              },
              child: Text('Date Picker'),
            ),
            Text('$_selectedTime'),
          ],
        )
    );
  }
}
