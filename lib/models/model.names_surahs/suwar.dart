/// id : 1
/// name : "Al-Fatihah "
/// start_page : 1
/// end_page : 1
/// makkia : 1
/// type : 0

class Surah {
  Surah({
      this.id, 
      this.name, 
      this.startPage, 
      this.endPage
  });

  Surah.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    startPage = json['start_page'];
    endPage = json['end_page'];
  }
  int? id;
  String? name;
  int? startPage;
  int? endPage;


}