import 'package:flutter/material.dart';
import 'package:Islami/features/details_screen/hadeth/text_style_hadeth.dart';
import 'package:provider/provider.dart';
import '../../../models/models.hadeth/hadeth.dart';
import '../../../provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsHadeth extends StatelessWidget {
  static const routeName = "DetailsHadeth";

  const DetailsHadeth({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var arg = ModalRoute.of(context)?.settings.arguments as Hadith;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getMainBackground()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(AppLocalizations.of(context)!.app_title),
        ),
        body: Card(
          margin: const EdgeInsets.all(20),
          elevation: 15,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(style: BorderStyle.solid,width: 1,color: Colors.transparent)
          ),
          child: Container(
              padding: const EdgeInsets.all(13),
              child: Column(
                children: [
                  Text(arg.title,style: Theme.of(context).textTheme.titleMedium,),
                   Divider(
                    indent: 25,
                    endIndent: 25,
                    height: 15,
                    thickness: 2,
                    color: Theme.of(context).hintColor,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) =>
                            TextStyleHadeth(content: arg.contentHadeth[index]),
                        itemCount: arg.contentHadeth.length),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
