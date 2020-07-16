import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoappstudy/database/memo.dart';
import 'package:memoappstudy/database/db.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key key, this.id}) : super(key: key);

  final String id;

  //findMemo(id)[0]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: LoadBuilder()
      ),
    );
  }
  
  Future<List<Memo>> loadMemo(String id) async {
    DBHelper sd = DBHelper();
    return await sd.findMemo(id);
  }
  
  LoadBuilder() {
    return FutureBuilder<List<Memo>>(
      future: loadMemo(id),
      builder: (BuildContext context, AsyncSnapshot<List<Memo>> snapshot){
        if (snapshot.data.isEmpty) {
          return Container(
            child : Text("데이터를 불러올 수 없습니다")
          );
        } else
          {
            Memo memo = snapshot.data[0];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 100,
                  child: SingleChildScrollView(
                      child: Text(memo.title,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),)
                          // 메모 보는 창에서 오버플로우를 방지
                  ),
                ),
                Text(
                  memo.title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Text(
                  '만든 시간 : ' + memo.createTime.split('.')[0],
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.end,
                ),
                Text(
                  '수정 시간 : ' + memo.editTime.split('.')[0],
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.end,
                ),
                Padding(padding: EdgeInsets.all(10.0),),
                Expanded(
                  child: SingleChildScrollView(
                      child: Text(memo.text)
                  ),
                ),
              ],
            );
          }
        },
    );
  }
}
