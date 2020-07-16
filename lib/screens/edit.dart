import 'package:flutter/material.dart';
import 'package:memoappstudy/database/memo.dart';
import 'package:memoappstudy/database/db.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class EditPage extends StatelessWidget {
  String title ='';
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveDB,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              maxLines: 2,
              onChanged: (String title){ this.title = title; }, //내용이 바뀌면 실행
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                labelText: '제목',
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0),),
            TextField(
              onChanged: (String text){ this.text = text; },
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              // keybordType부터 maxlines 설명 : 내용이 넘치면 밑으로 내려가게
              decoration: InputDecoration(
                hintText: '메모의 내용을 적어주세요',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async {

    DBHelper sd = DBHelper();

    var fido = Memo(
      id: Str2sha512(DateTime.now().toString()),
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
  }

  String  Str2sha512(String text) {
    var bytes = utf8.encode(text); // data being hashed
    var digest = sha512.convert(bytes);

    return digest.toString();
  }
}
