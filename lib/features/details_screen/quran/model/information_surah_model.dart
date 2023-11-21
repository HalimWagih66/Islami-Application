class InformationSurahModel{
  final int startPage;
  final int endPage;
  final int suraNumber;
  final int numberOfVerses;
  final String surahNameTashkil;
  final String surahName;
  InformationSurahModel(
      {required this.startPage,
      required this.endPage,
      required this.suraNumber,
      required this.numberOfVerses,
      required this.surahNameTashkil,
      required this.surahName});
}