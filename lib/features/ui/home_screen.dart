import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/core/constans.dart';
import 'package:movies_app/core/widgets/home_widget.dart';
import 'package:movies_app/features/ui/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_app/providers/myProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool iconBool = false;
  Widget iconLight = const Icon(Icons.wb_sunny);
  Widget iconDark = const Icon(Icons.nights_stay);
  int Index = 0;
  ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff6D5D6E)),
      scaffoldBackgroundColor: Color(0xffEAB2A0),
      brightness: Brightness.light);
  ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff27374D)),
      scaffoldBackgroundColor: Apptheme.myPrimaryColor,
      brightness: Brightness.dark);

  List<Widget> tabs = [const HomeWidget(), const SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: iconBool ? darkTheme : lightTheme,
        home: Scaffold(
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BottomNavigationBar(
                  onTap: (value) {
                    setState(() {
                      Index = value;
                    });
                    print(value);
                  },
                  currentIndex: Index,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: const Color.fromARGB(255, 97, 97, 97),
                  backgroundColor: Apptheme.bottomNavColor,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_max_outlined,
                        size: 40,
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          size: 40,
                        ),
                        label: ""),
                  ]),
            ),
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        iconBool = !iconBool;
                      });
                    },
                    icon: iconBool ? iconDark : iconLight)
              ],
              // backgroundColor: const Color(0xff27374D),
              automaticallyImplyLeading: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.hello,
                    style: Apptheme.appBarTextLarge,
                  ),
                  Text(
                    AppLocalizations.of(context)!.watch,
                    style:
                        Apptheme.appBarTextSmall.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            body: tabs.elementAt(Index)),
      ),
    );
  }
}
