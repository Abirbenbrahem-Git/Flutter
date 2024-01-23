
class Picture
{
  int? id;
  String author;
  double? width;
  double? height;
  String url;

  Picture({this.id, required this.author, this.width,this.height,required this.url});

  Map<String, dynamic> toJson()
  {
    return {
      'id' : this.id,
      'author' : this.author,
      'width' : this.width,
      'height' : this.height,
      'url': this.url,
    };
  }

  factory Picture.fromJson(Map<String, dynamic> data)
  {
    return Picture(id:data['id'], author: data['author'], width:data['width'],height:data['height'],url:data['url']);
  }


}


