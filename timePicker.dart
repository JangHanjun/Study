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

  String _selectedTime;

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
              onPressed: () {
                Future<TimeOfDay> selectedTime = showTimePicker(
                  initialTime: TimeOfDay.now(),  //초깃값 지정  뒤의 함수는 현재 시간을 설정해줌
                  context: context,
                );
                //여기서 사용자가 시간을 정할 때까지 코드가 블록됨

                selectedTime.then((timeOfDay){
                  setState(() {
                    _selectedTime = '${timeOfDay.hour}:${timeOfDay.minute}';
                  });
                });
              },
              child: Text('Time Picker'),
            ),
            Text('$_selectedTime'),
          ],
        ),
    );
  }
}
