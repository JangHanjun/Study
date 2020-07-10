import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
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
            icon: const Icon(Icons.save),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                labelText: '제목',
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0),),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
}
