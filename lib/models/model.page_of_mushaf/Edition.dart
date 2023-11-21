/// identifier : "quran-uthmani"
/// language : "ar"
/// name : "القرآن الكريم برسم العثماني"
/// englishName : "Uthmani"
/// format : "text"
/// type : "quran"
/// direction : "rtl"

class Edition {
  Edition({
      this.name
  });

  Edition.fromJson(dynamic json) {
    name = json['name'];
  }
  String? name;

}