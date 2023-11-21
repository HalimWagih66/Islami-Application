import 'Data.dart';

class AyaAudioResponse {
  AyaAudioResponse({
      this.code, 
      this.status, 
      this.data,});

  AyaAudioResponse.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? code;
  String? status;
  Data? data;

}