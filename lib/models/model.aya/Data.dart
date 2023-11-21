
class Data {
  Data({
      this.audio,
     });

  Data.fromJson(dynamic json) {
    audio = json['audio'];

  }
  String? audio;
}