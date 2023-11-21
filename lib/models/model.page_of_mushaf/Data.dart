import 'ayahs.dart';
import 'Edition.dart';

/// ayahs : [{"number":1,"text":"بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ","surah":{"number":1,"name":"سُورَةُ ٱلْفَاتِحَةِ","englishName":"Al-Faatiha","englishNameTranslation":"The Opening","revelationType":"Meccan","numberOfAyahs":7},"numberInSurah":1,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":2,"text":"ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ","surah":{"number":1,"name":"سُورَةُ ٱلْفَاتِحَةِ","englishName":"Al-Faatiha","englishNameTranslation":"The Opening","revelationType":"Meccan","numberOfAyahs":7},"numberInSurah":2,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":3,"text":"ٱلرَّحْمَٰنِ ٱلرَّحِيمِ","surah":{"number":1,"name":"سُورَةُ ٱلْفَاتِحَةِ","englishName":"Al-Faatiha","englishNameTranslation":"The Opening","revelationType":"Meccan","numberOfAyahs":7},"numberInSurah":3,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":4,"text":"مَٰلِكِ يَوْمِ ٱلدِّينِ","surah":{"number":1,"name":"سُورَةُ ٱلْفَاتِحَةِ","englishName":"Al-Faatiha","englishNameTranslation":"The Opening","revelationType":"Meccan","numberOfAyahs":7},"numberInSurah":4,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":5,"text":"إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ","surah":{"number":1,"name":"سُورَةُ ٱلْفَاتِحَةِ","englishName":"Al-Faatiha","englishNameTranslation":"The Opening","revelationType":"Meccan","numberOfAyahs":7},"numberInSurah":5,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":6,"text":"ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ","surah":{"number":1,"name":"سُورَةُ ٱلْفَاتِحَةِ","englishName":"Al-Faatiha","englishNameTranslation":"The Opening","revelationType":"Meccan","numberOfAyahs":7},"numberInSurah":6,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false},{"number":7,"text":"صِرَٰطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ ٱلْمَغْضُوبِ عَلَيْهِمْ وَلَا ٱلضَّآلِّينَ","surah":{"number":1,"name":"سُورَةُ ٱلْفَاتِحَةِ","englishName":"Al-Faatiha","englishNameTranslation":"The Opening","revelationType":"Meccan","numberOfAyahs":7},"numberInSurah":7,"juz":1,"manzil":1,"page":1,"ruku":1,"hizbQuarter":1,"sajda":false}]
/// edition : {"identifier":"quran-uthmani","language":"ar","name":"القرآن الكريم برسم العثماني","englishName":"Uthmani","format":"text","type":"quran","direction":"rtl"}

class Data {
  Data({
      this.ayahs,
      this.edition,});

  Data.fromJson(dynamic json) {
    if (json['ayahs'] != null) {
      ayahs = [];
      json['ayahs'].forEach((v) {
        ayahs?.add(Ayahs.fromJson(v));
      });
    }
    edition = json['edition'] != null ? Edition.fromJson(json['edition']) : null;
  }
  List<Ayahs>? ayahs;
  Edition? edition;



}