///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/7/1 12:54
///
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:what_to_eat/constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveBoxes.openBoxes();

  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Screens.mediaQuery.platformBrightness,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();

  int currentPage = 0;
  StreamController<int> pageStream = StreamController<int>();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final int newPage = controller.page.round();
      if (newPage != currentPage) {
        currentPage = controller.page.round();
        pageStream.add(currentPage);
      }
    });
  }

  void setCurrentPage(int index) {
    controller.animateToPage(
      index,
      duration: kThemeChangeDuration,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  '今天吃啥🥢',
                  style: TextStyle(fontSize: 36.0),
                ),
                Text(
                  '金饭碗',
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  width: Screens.width / 2,
                  height: Screens.width / 2,
                  decoration: BoxDecoration(
                    color: context.themeData.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '啥都没配\n就想摇🐎',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              FixedAppBar(title: Text('操作记录')),
              Spacer(),
            ],
          ),
          SizedBox(),
        ],
      ),
      bottomNavigationBar: StreamBuilder<int>(
        initialData: 0,
        stream: pageStream.stream,
        builder: (BuildContext _, AsyncSnapshot<int> data) {
          return BottomNavigationBar(
            currentIndex: data.data,
            onTap: setCurrentPage,
            items: List<BottomNavigationBarItem>.generate(
              Constants.navigationItems.length,
              (int index) {
                return BottomNavigationBarItem(
                  icon: Icon(Constants.navigationIcons[index]),
                  title: Text(Constants.navigationItems[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
