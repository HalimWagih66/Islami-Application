import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view model/details_quran_view_model.dart';

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({super.key, required this.currentSurahNumber, required this.currentPageNumber});
  final int currentSurahNumber;
  final int currentPageNumber;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DetailsQuranViewModel>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0),
      onPressed: ()async {
        await provider.changeBookMark(currentSurahNumber, currentPageNumber);
      },
      child: Icon(Icons.bookmark, color: provider.checkPageBookMark(currentSurahNumber: currentSurahNumber, currentPageNumber: currentPageNumber)? Colors.red:const Color(
          0x3adf0000), size: 60),
    );
  }
}
