class SurahInfoInPage{
  late String surahName;

  SurahInfoInPage.fromJson(dynamic json) {
    surahName = json['name'];
  }

  @override
  String toString() {
    return 'SurahInfoInPage{surahName: $surahName}';
  }
}