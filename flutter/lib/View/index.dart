import 'package:flutter/material.dart';

class index extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("index")),
        body:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(onPressed:(){Navigator.pushNamed(context, '/allPictures');} , child: Text("all Pictures"))
          ],
        )
    );
  }

}