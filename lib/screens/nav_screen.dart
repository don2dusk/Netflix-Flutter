import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_flutter/cubits/cubits.dart';
import 'package:netflix_flutter/screens/screens.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/responsive.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icon = [
    Iconsax.home4,
    Iconsax.home5,
    Iconsax.play_circle4,
    Iconsax.play_circle5,
    Iconsax.heart4,
    Iconsax.heart5,
    Iconsax.user4,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? Row(
              children: [
                customNavBar(
                  0,
                  _icon[0],
                  _icon[1],
                ),
                customNavBar(
                  1,
                  _icon[2],
                  _icon[3],
                ),
                customNavBar(
                  2,
                  _icon[4],
                  _icon[5],
                ),
                customNavBar(
                  3,
                  _icon[6],
                  _icon[6],
                )
              ],
            )
          : null,
    );
  }

  Widget customNavBar(int index, IconData icon, IconData selIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Icon(
          _currentIndex == index ? selIcon : icon,
          color: _currentIndex == index
              ? Color.fromARGB(236, 226, 21, 24)
              : Colors.grey[300],
          size: 30,
        ),
      ),
    );
  }
}
