import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(), // 스크롤 끝에서 팅기는 효과
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Text('메모메모', style: TextStyle(fontSize: 36, color: Colors.blue)),
              )
            ],
          ),
          ...LoadMemo() // ...은 리스트가 다 돌때까지 해주는 역할

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => EditPage())
          );
        },
        tooltip: '메모를 추가할려면 클릭하세요',
        label: Text('메모추가'),
        icon: Icon(Icons.add),
      ),
    );
  }
  List<Widget> LoadMemo() {
    List<Widget> memoList = [];
    memoList.add(Container(color: Colors.redAccent, height: 100,),);
    memoList.add(Container(color: Colors.yellow, height: 100,),);
    memoList.add(Container(color: Colors.pink, height: 100,),);
    return memoList;
  }
}


