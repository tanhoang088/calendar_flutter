import 'package:calendar_flutter/page/createEvent_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isCalendar = false;
  bool isTodayjob = false;
  bool isNotification = false;
  bool isPersonalSetting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: IconTheme(
            data: IconThemeData(color: Colors.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  isSelected: isCalendar,
                  tooltip: 'Calendar',
                  icon: SvgPicture.asset('assets/icons/ic_calendar.svg'),
                  selectedIcon: SvgPicture.asset('assets/icons/ic_calendar.svg',
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    setState(() {
                      isCalendar = true;
                      isTodayjob = false;
                      isNotification = false;
                      isPersonalSetting = false;
                    });
                  },
                ),
                IconButton(
                  isSelected: isTodayjob,
                  tooltip: 'Today Job',
                  icon: SvgPicture.asset('assets/icons/ic_clock.svg'),
                  selectedIcon: SvgPicture.asset('assets/icons/ic_clock.svg',
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    setState(() {
                      isCalendar = false;
                      isTodayjob = true;
                      isNotification = false;
                      isPersonalSetting = false;
                    });
                  },
                ),
                IconButton(
                  isSelected: isNotification,
                  tooltip: 'Notifications',
                  icon: SvgPicture.asset('assets/icons/ic_notification.svg'),
                  selectedIcon: SvgPicture.asset('assets/icons/ic_notification.svg',
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    setState(() {
                      isCalendar = false;
                      isTodayjob = false;
                      isNotification = true;
                      isPersonalSetting = false;
                    });
                  },
                ),
                IconButton(
                  isSelected: isPersonalSetting,
                  tooltip: 'Personal Setting',
                  icon: SvgPicture.asset('assets/icons/ic_user.svg'),
                  selectedIcon: SvgPicture.asset('assets/icons/ic_user.svg',
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    setState(() {
                      isCalendar = false;
                      isTodayjob = false;
                      isNotification = false;
                      isPersonalSetting = true;
                    });
                  },
                ),
              ],
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        shape: CircleBorder(),
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) => CreateEventWidget(),
          );
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
