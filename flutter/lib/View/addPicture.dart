import 'package:flutter/material.dart';

import '../Service/PictureService.dart';

import '../Model/picture.dart';

class addPicture extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return addPictureState();
  }
}

class addPictureState extends State
{
  var key_form = GlobalKey<FormState>();
  var c1 = TextEditingController();
  var c2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("Add new Picture")),
     body: Form(
       key:key_form,
       child: Container(padding: EdgeInsets.all(20),
         child: Column(children: [
           TextFormField(controller:c1, decoration: InputDecoration(hintText: 'author'),
           validator: (value){
             if(value==null || value == "")
               return "Enter the author";
             else
               return null;
           }),
           TextFormField(controller:c2, decoration: InputDecoration(hintText: 'width')),
           Container(height: 10),
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [ ElevatedButton(onPressed: (){

            if(key_form.currentState!.validate())
              {
              Picture p = Picture(author: c1.text, width: double.parse(c2.text));
              PictureService.addPicture(p).then((value) {
              String msg="";
              if(value==200)
              msg ="Picture added succes";
              else
              msg ="ERROR $value";
              SnackBar sn = new SnackBar(content: Text('$msg'));
              ScaffoldMessenger.of(context).showSnackBar(sn);
              });

           }}, child: Text("Add")), OutlinedButton(onPressed: (){}, child: Text("reset")),],)

         ]),
       ),
     )
   );
  }

}