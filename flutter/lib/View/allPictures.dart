import 'package:flutter/material.dart';
import '../Model/picture.dart';
import '../Service/PictureService.dart';

class allPictures extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allPictureState();
  }
}

class allPictureState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text('+'),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            }),
        appBar: AppBar(title: Text("List of pictures")),
        body: Container(
            padding: EdgeInsets.all(20),
            child: FutureBuilder(
                future: PictureService.getAllPictures(),
                builder: (context, snapshot) {
                  print(snapshot.hasData);
                  if (snapshot.hasData) {
                    List<Picture>? l = snapshot.data;

                    return ListView.builder(
                        itemCount: l!.length,
                        itemBuilder: (context, i) {
                          return Card(
                              margin: EdgeInsets.all(10),
                              child: Column(children: [
                                Image.network('${l[i].url![0]}',
                                    fit: BoxFit.fitWidth, height: 100),
                                ListTile(
                                  leading: Text("${l[i].id}"),
                                  title: Text("${l[i].author}"),
                                  subtitle: Text("${l[i].width}"),
                                  trailing: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        PictureService.deletePicture(l[i].id!)
                                            .then((value) {
                                          String msg = "";
                                          if (value == 200)
                                            msg = "deleted success";
                                          else
                                            msg = "error";
                                          SnackBar sn =
                                          new SnackBar(content: Text(msg));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(sn);
                                        });
                                        setState(() {

                                        });
                                      }),
                                )
                              ]));
                        });
                  } else
                    return Text("No data");
                })
        ));
  }
}
