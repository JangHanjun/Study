import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var titlesection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(8.0)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬임
          children: <Widget>[
            Text(
              'CampGround',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            Text(
              'Korea',
              style: TextStyle(color: Colors.grey, fontSize: 26),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(20.0)),
        Icon(
          Icons.star,
          size: 35,
          color: Colors.deepOrange,
        ),
        Text(
          '41',
          style: TextStyle(fontSize: 25.0),
        ),
      ],
    );

    var buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(
              Icons.call,
              size: 45,
              color: Colors.blue,
            ),
            Text(
              'CALL',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
          Padding(padding: EdgeInsets.all(40.0)),
        Column(
          children: <Widget>[
            Icon(Icons.near_me, size: 45, color: Colors.blue),
            Text('ROUTE', style: TextStyle(color: Colors.blue))
          ],
        ),
          Padding(padding: EdgeInsets.all(40.0)),
        Column(
          children: <Widget>[
            Icon(Icons.share, size: 45, color: Colors.blue),
            Text('SHARE', style: TextStyle(color: Colors.blue))
          ],
        ),
      ],
    );

    var textSection = Container(
      child: Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
            'Lorem Ipsum has been the industrys standard dummy text ever since the '
            '1500s, when an unknown printer took a galley of type and scrambled it '
            'to make a type specimen book. It has survived not only five centuries,',
        style: TextStyle(fontSize: 20),
      ),
      padding: EdgeInsets.all(20.0),
    );
    
    

    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.network(
            "https://lh3.googleusercontent.com/proxy/qzQpcP5ULC2lynTtJBQ2x5aKLeE5XhwbWNZhgB9Gi6ptafBAEHMDpb-A-7VIjQlqMZ3G-tvONh0CbsY0U4cvEyFwR9-VgMSk02B-DI2vYk4Ug-3Ht5mLYOWb4S2NacBtfAeJersVu-XfqTqd6m4felSGbSqN5YBD1Hf59DZJOgaHxie9gDYhAJ4tgQD3ajn2copXiTl3h-suDS2Qjen6ixDzPi8H3LnG4zThD7NM4KxAkulMa1P1Qauz-mXGPMwaq9Syuaakqw",
            // 이런 주소형식의 이미지는 많으면 로딩이 많이 걸림
            height: 240,
            width: 600,
            fit: BoxFit.cover, //비어있는 부분을 커버
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          titlesection,
          Padding(padding: EdgeInsets.all(10.0)),
          buttonSection,
          Padding(padding: EdgeInsets.all(5.0)),
          textSection,
        ],
      ),
    );
  }
}
