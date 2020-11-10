import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';

class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';
  static const _kFontPkg = null;

  static const IconData weapon_awp = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData weapon_c4 = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData weapon_deagle = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData weapon_knife_karambit = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData weapon_mag7 = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData weapon_p90 = IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

const PrimaryColor = const Color(0xFF151026);
class ggwp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: PrimaryColor,
            title: const Text('GGWP'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'KNIFE', icon: MyFlutterApp.weapon_knife_karambit,),
  const Choice(title: 'PISTOL', icon: MyFlutterApp.weapon_deagle),
  const Choice(title: 'SMG', icon: MyFlutterApp.weapon_p90),
  const Choice(title: 'RIFLE', icon: MyFlutterApp.weapon_awp),
  const Choice(title: 'HEAVY', icon: MyFlutterApp.weapon_mag7),
  const Choice(title: 'MISC', icon: MyFlutterApp.weapon_c4),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
// 44
// 7447
//  921094
void main() {
  runApp(ggwp());
}
