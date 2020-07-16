import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
import 'package:memoappstudy/database/memo.dart';
import 'package:memoappstudy/database/db.dart';
import 'package:memoappstudy/screens/view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String deleteId = ''; // showAlertDialog에 삭제 기능에 사용하기 위해 만듬
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 40, bottom: 20),
            child: Container(
              child: Text('메모메모',
                  style: TextStyle(fontSize: 36, color: Colors.blue)),
              alignment: Alignment. centerLeft,
            ),
          ),
          Expanded(child: memoBuilder(context)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => EditPage()));
        },
        tooltip: ' + 메모추가  버튼을 눌러 새로운 메모를 추가해보세요!',
        label: Text('메모'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    return await sd.deleteMemo(id);
  }

  void showAlertDialog(BuildContext context) async {
    // async 라서 deletedId 초기화를 여기서 해야함.
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 경고'),
          content: Text("정말로 삭제하시겠습니까?\n삭제시 복구는 불가능합니다"),
          actions: <Widget>[
            FlatButton(
              child: Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
                setState(() {
                  deleteMemo(deleteId);
                  deleteId = ''; //deleteId 다시 초기화
                });
              },
            ),
            FlatButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context, "취소");
                deleteId = ''; //deleteId 다시 초기화
              },
            ),
          ],
        );
      },
    );
  }


  Widget memoBuilder(BuildContext parentContext) {
    return FutureBuilder(
      builder: (context, Snap) {
        if (Snap.data.isEmpty) { //데이터가 없으면 아래 컨테이너 출력
          return Container(
            alignment: Alignment.center,
            child: Text(
              '지금 "+ 메모추가"  버튼을 눌러\n 새로운 메모를 추가해보세요!\n\n\n\n\n\n\n',
              style: TextStyle(fontSize: 15, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          );
        }


        return ListView.builder(
          physics: BouncingScrollPhysics(), //스크롤시 쫀득하게
          itemCount: Snap.data.length,
          itemBuilder: (context, index) {
            Memo memo = Snap.data[index];

            return InkWell(
              onTap: (){
                Navigator.push(
                    parentContext, CupertinoPageRoute(builder: (context) => ViewPage(id : memo.id))
                );
              },
              onLongPress: (){
                setState(() {
                  deleteId = memo.id;
                  showAlertDialog(parentContext);
                });
              },  //길게 누를시의 기능
              // onDoubleTap: (){},  //두번 누를 때
              child: Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(15),
                height: 100,
                alignment: Alignment.center,


                decoration: BoxDecoration(
                  color: Color.fromRGBO(230, 230, 230, 1), //RGB, Opacity
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
                  borderRadius: BorderRadius.circular(12),
                ),


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          memo.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500
                          ),
                          overflow: TextOverflow.ellipsis, //오버플로우시 ...으로 생략
                        ),
                        Text(
                          memo.text,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "최종 수정 시간: " + memo.editTime.split('.')[0], //초 단위 까지만 나오게 수정
                          style: TextStyle(
                              fontSize: 12
                          ),
                          textAlign: TextAlign.end, // 시간은 오른쪽 끝으로 보냄
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}
