import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

import '../models/model.aya/AyaAudioResponse.dart';
import '../models/model.names_surahs/names_surahs_response.dart';
import '../models/model.names_surahs/suwar.dart';
import '../models/model.page_of_mushaf/PageOfMushafResponse.dart';
import '../models/model.radio/radio.dart';
import '../models/model.radio/radio_response.dart';


class ApiManager{
  static Dio dio = Dio();
  static Future<List<RadioModel>> getRadio(String language) async {
    Response response  = await dio.get("https://mp3quran.net/api/v3/radios?language=$language");
    RadioResponse radioResponse = RadioResponse.fromJson(response.data);
    return radioResponse.collectionRadio ?? [];
  }
  static Future<List<Surah>?> getNamesSurahs(String language) async {
    print("language $language");
    Uri uri  = Uri.parse("https://mp3quran.net/api/v3/suwar?language=$language");
    http.Response response  = await http.get(uri);
    if (response.statusCode == 200) {
      NamesSurahsResponse namesSurahsResponse = NamesSurahsResponse.fromJson(jsonDecode(response.body));
      return namesSurahsResponse.collectionSurahs;
    } else {
      throw Exception('Failed to get data');
    }
  }
  static Future<PageOfMushafResponse> getPageOfMushaf(int startPage) async {
    print("startPage $startPage");
    Response response  = await dio.get("http://api.alquran.cloud/v1/page/$startPage/quran-uthmani");
    print(response.data);
    if (response.statusCode == 200) {
      PageOfMushafResponse pageOfMushafResponse = PageOfMushafResponse.fromJson(response.data);
      return pageOfMushafResponse;
    } else {
      throw Exception('Failed to get data');
    }
  }
  static Future<String?> getAyaAudio(int surahNumber,int verseNumber) async {
    print("surahNumber $surahNumber : verseNumber $verseNumber");
    Uri uri = Uri.parse("http://api.alquran.cloud/v1/ayah/${surahNumber+1}:$verseNumber/ar.alafasy");
    print("uri $uri");
   http.Response response  = await http.get(uri);
   print("aya audio ${response.body}");
    if (response.statusCode == 200) {
      AyaAudioResponse ayaAudioResponse = AyaAudioResponse.fromJson(jsonDecode(response.body));
      return ayaAudioResponse.data?.audio;
    } else {
      throw Exception('Failed to get data');
    }
  }
}