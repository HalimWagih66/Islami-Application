import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../layout_screen/provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbehDetails extends StatefulWidget {
  static const routeName = "TasbehDetails";

  const TasbehDetails({super.key});

  @override
  State<TasbehDetails> createState() => _TasbehDetailsState();
}

class _TasbehDetailsState extends State<TasbehDetails> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    String textTasbeh = ModalRoute.of(context)?.settings.arguments as String;
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
          title: Text(AppLocalizations.of(context)!.tasbeh),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Align(
                    heightFactor: 0.4,
                    widthFactor: 0.9,
                    child: Image(
                        image: AssetImage(
                            "assets/images/details_tasbeh/head of seb7a.png"))),
                const Image(
                  image: AssetImage(
                      "assets/images/details_tasbeh/body of seb7a.png"),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "عدد التسبيحات",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    counter++;
                    setState(() {});
                  },
                  child: Text("$counter",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).hintColor,
                      ),
                      padding:
                          const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                      child: Text(
                        textTasbeh,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Theme.of(context).cardColor),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}