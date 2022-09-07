import 'package:flutter/material.dart';
import 'package:news/modules/setting/show_language_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/app_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back,color: Colors.white,),),
        title: Text(AppLocalizations.of(context)!.setting,style: TextStyle(color: Colors.white,fontSize: 22),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(AppLocalizations.of(context)!.language,
                  style:TextStyle(
                    color: Colors.black
                    ,fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: (){
                  showLanguageBottomShet();
                },
                child:Container(
                    height: 50,width: 300,
                    padding: EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,

                      border: Border.all(color: Color(0XFF39A552)),
                    ),
                    child: Text(provider.AppLanguage=='en'?AppLocalizations.of(context)!.english
                        :AppLocalizations.of(context)!.arabic,
                      style:
                      TextStyle(
                        color: Color(0XFF39A552),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),

    );
  }

  void showLanguageBottomShet(){

    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context, builder: (context){
      return ShowLanguageBottomSheet();
    });
  }
}
