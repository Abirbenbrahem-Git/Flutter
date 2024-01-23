import 'dart:convert';

import 'package:http/http.dart';

import '../Model/picture.dart';

class PictureService
{
  static final String URL ="https://picsum.photos/v2/list";

  static Future<List<Picture>?> getAllPictures() async
  {
    List<Picture>? l ;
    Response response =await get(Uri.parse(URL));
    if(response.statusCode == 200)
    {
      var body = jsonDecode(response.body)['pictures'];
      l = [];
      for(Map<String, dynamic> m in body)
      {

        l!.add(Picture.fromJson(m));
      }

    }
    return l;
  }


  static Future<int> addPicture(Picture p) async
  {
    var headers ={'Content-Type':'application/json;charset=UTF-8'} ;
    var body = jsonEncode(p);
    Response response = await post(Uri.parse(URL+"/add"), headers: headers, body:body);
    return response.statusCode;

  }

  static Future<int> deletePicture(int id) async
  {
    Response response = await delete(Uri.parse(URL+'/$id'));
    return response.statusCode;

  }
}