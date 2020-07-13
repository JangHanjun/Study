import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
import 'package:memoappstudy/database/memo.dart';
import 'package:memoappstudy/database/db.dart';

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
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text('메모메모',
                style: TextStyle(fontSize: 36, color: Colors.blue)),
          ),
          Expanded(child: memoBuilder()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => EditPage()));
        },
        tooltip: '메모를 추가할려면 클릭하세요',
        label: Text('메모추가'),
        icon: Icon(Icons.add),
      ),
    );
  }

  List<Widget> LoadMemo() {
    List<Widget> memoList = [];
    memoList.add(
      Container(
        color: Colors.redAccent,
        height: 100,
      ),
    );
    memoList.add(
      Container(
        color: Colors.yellow,
        height: 100,
      ),
    );
    return memoList;
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }


  Widget memoBuilder() {
    return FutureBuilder(
      builder: (context, Snap) {
        if (Snap.data.isEmpty) { //데이터가 없으면 아래 컨테이너 출력
          return Container(child: Text("메모를 추가해보세요"),);
        }
        return ListView.builder(
          itemCount: Snap.data.length,
          itemBuilder: (context, index) {
            Memo memo = Snap.data[index];
            return Column(
              children: <Widget>[
                Text(memo.title),
                Text(memo.text),
                Text(memo.editTime),
              ],
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}
