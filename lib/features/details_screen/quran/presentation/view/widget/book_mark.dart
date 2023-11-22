import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../provider/provider_about_surahs.dart';

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({super.key, required this.currentSurahNumber, required this.currentPageNumber});
  final int currentSurahNumber;
  final int currentPageNumber;
  @override
  Widget build(BuildContext context) {
    var surahsInfoProvider = Provider.of<SurahsInfoProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0),
      onPressed: ()async {
        await surahsInfoProvider.changeBookMark(currentSurahNumber, currentPageNumber);
      },
      child: Icon(Icons.bookmark, color: surahsInfoProvider.checkPageBookMark(currentSurahNumber: currentSurahNumber, currentPageNumber: currentPageNumber)? Colors.red:const Color(
          0x3adf0000), size: 60.h),
    );
  }
}
