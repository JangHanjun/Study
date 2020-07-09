import 'package:flutter/material.dart';
import 'dart:async';  // Timer 클래스를 사용하기 위해

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'StopWatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StopWatchPage(),
    );
  }
}

class StopWatchPage extends StatefulWidget {
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer _timer;  // 타이머

  var _time = 0;  // 0.01 초마다 1씩 증가시킬 정수형 변수
  var _isRunning = false;   // 현재 상태를 나타낼 변수

  List<String> _lapTimes = [];  // 랩타임에 표시할 시간을 저장할 리스트

  @override
  void dispose(){  // dispose 메소드를 재정의 해서 앱을 종료할때 타이머를 취소하게 함
   _timer?.cancel();
   super.dispose();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatch'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _clickButton();
        }),
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //내용
  Widget _buildBody() {
    var sec = _time ~/ 100;  // 초
    var hunderedth = '${_time % 100}'.padLeft(2, '0');  //밀리초


    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row( //시간을 표시하는 영역
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '$sec',  // 초단위
                      style: TextStyle(fontSize: 50.0),
                    ),
                    Text('$hunderedth'),  // 점몇초
                  ],
                ),
                Container(
                  width: 100,
                  height: 400,
                  child: ListView(
                    children: _lapTimes.map((time) => Text(time)).toList(),
                  ),
                )
              ],
            ),
            Positioned(
              left: 20,
              bottom: 10,
              child: FloatingActionButton( // 왼쪽 아래에 위치한 초기화 버튼
                backgroundColor: Colors.deepOrange,
                onPressed: _reset,
                child: Icon(Icons.rotate_left),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 10,
              child: RaisedButton(  // 오른쪽 아래에 위치한 랩타임 버튼
                onPressed: () {
                  setState(() {
                    _recordLapTime('$sec.$hunderedth');
                  });
                },
                child: Text('랩타임'),
              ),
            )
          ],
        )
      ),
    );
  }

  // 시작 또는 일시정지 버튼 클릭
  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start(){
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer){
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset(){
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time = 0;
    });
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, '${_lapTimes.length +1}등 $time');
  }
}
