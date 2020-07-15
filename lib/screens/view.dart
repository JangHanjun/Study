import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key key, this.id}) : super(key: key);

  final String id;

  //findMemo(id)[0]

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id)
    );
  }
}
