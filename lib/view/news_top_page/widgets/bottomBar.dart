import 'package:flutter/material.dart';
import 'package:newslist/env/env.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          selectIndex = index;
        });

        if (selectIndex == 1) {
          context.push(iniRote);
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          activeIcon: Icon(Icons.list),
          label: 'ニュース一覧',
          tooltip: 'ニュース一覧',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
          tooltip: '設定',
        ),
      ],
      currentIndex: selectIndex,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
      iconSize: 18,
      selectedFontSize: tt.displayLarge!.fontSize!,
      selectedIconTheme: const IconThemeData(
        size: 30,
        color: Colors.green,
      ),
      selectedItemColor: Colors.black,
      unselectedFontSize: tt.displayMedium!.fontSize!,
      unselectedIconTheme: const IconThemeData(
        size: 25,
        color: Colors.black,
      ),
    );
  }
}
