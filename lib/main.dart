import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:singularsplash/screens/explorepage.dart';
import 'package:singularsplash/screens/favoritepage.dart';
import 'package:singularsplash/screens/homepage.dart';
import 'package:singularsplash/screens/settingspage.dart';
import 'package:singularsplash/utils/my_state.dart';
import 'package:singularsplash/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: false);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Widget> pages = [
    HomePage(),
    ExplorePage(),
    FavoritePage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeState()),
          ChangeNotifierProvider(create: (context) => PageState())
        ],
        builder: (context, _) {
          final themeState = Provider.of<ThemeState>(context);
          final pageState = Provider.of<PageState>(context);
          themeState.getTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // this will prevent app from closing on
            // pressing back button unless we are on homepage
            home: WillPopScope(
              onWillPop: () async {
                if (pageState.currentPage != 0) {
                  pageState.changePage(0);
                  controller.jumpTo(0);
                  return false;
                } else
                  return true;
              },
              child: Scaffold(
                body: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  children: pages,
                  onPageChanged: (index) {
                    pageState.changePage(index);
                  },
                ),
                bottomNavigationBar: BottomNavBar(pageController: controller),
              ),
            ),

            themeMode: themeState.currentThemeMode,
            theme: themeState.getLightTheme(),
            darkTheme: themeState.getDarkTheme(),
          );
        });
  }
}
