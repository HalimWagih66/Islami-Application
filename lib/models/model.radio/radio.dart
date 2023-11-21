// /// name : "---إذاعة صور من حياة الصحابة رضوان الله عليهم---"
// /// radio_url : "https://backup.qurango.net/radio/sahabah"
//
class RadioModel {
  RadioModel({
      this.name,
      this.radioUrl,});

  RadioModel.fromJson(dynamic json) {
    name = json['name'];
    radioUrl = json['url'];
  }
  String? name;
  String? radioUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['radio_url'] = radioUrl;
    return map;
  }

}