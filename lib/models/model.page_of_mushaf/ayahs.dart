
import 'package:islami_app/models/model.page_of_mushaf/surah_info_in_page.dart';

/// text : "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ"
/// numberInSurah : 1
/// page : 1

class Ayahs {
  Ayahs({
      this.text,
      this.numberInSurah,
      this.page,
    this.surahInfoInPage
});

  Ayahs.fromJson(dynamic json) {
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    page = json['page'];
    surahInfoInPage = json['surah'] != null ? SurahInfoInPage.fromJson(json['surah']) : null;
  }
  String? text;
  int? numberInSurah;
  int? page;
  SurahInfoInPage? surahInfoInPage;

  @override
  String toString() {
    return 'Ayahs{text: $text, numberInSurah: $numberInSurah, page: $page, surahInfoInPage: $surahInfoInPage}';
  }
}