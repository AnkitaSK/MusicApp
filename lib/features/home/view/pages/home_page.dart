import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // int selectedIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: selectedIndex,
        onTap: (value) {
          // setState(() {
          //   selectedIndex = value;
          // });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home_filled.png'),
            // selectedIndex == 0
            // ? 'assets/images/home_filled.png'
            // : 'assets/images/home_unfilled.png',
            // color: selectedIndex == 0
            //     ? Pallete.whiteColor
            //     : Pallete.inactiveBottomBarItemColor,
            // ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/library.png'),
            // 'assets/images/library.png',
            // color: selectedIndex == 1
            //     ? Pallete.whiteColor
            //     : Pallete.inactiveBottomBarItemColor,
            // ),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
