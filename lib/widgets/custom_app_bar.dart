import 'package:flutter/material.dart';
import 'package:netflix_flutter/widgets/widgets.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        color: Colors.black,
        child: Responsive(
          mobile: _CustomAppBarMobile(),
          desktop: _CustomAppBarDesktop(),
        ));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(Assets.netflixLogo1),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatefulWidget {
  const _CustomAppBarDesktop({super.key});

  @override
  State<_CustomAppBarDesktop> createState() => __CustomAppBarDesktopState();
}

class __CustomAppBarDesktopState extends State<_CustomAppBarDesktop> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(children: [
      Image.asset(Assets.netflixLogo1),
      const SizedBox(width: 12.0),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _AppBarButton(title: 'Home', onTap: () => print('Home')),
            _AppBarButton(title: 'TV Shows', onTap: () => print('TV Shows')),
            _AppBarButton(title: 'Movies', onTap: () => print('Movies')),
            _AppBarButton(title: 'Latest', onTap: () => print('Latest')),
            _AppBarButton(title: 'My List', onTap: () => print('My List'))
          ],
        ),
      ),
      const Spacer(),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () => print('Search'),
                iconSize: 28,
                color: Colors.white,
                icon: Icon(Icons.search)),
            _AppBarButton(title: 'KIDS', onTap: () => print('KIDS')),
            _AppBarButton(title: 'DVD', onTap: () => print('DVD')),
            IconButton(
                onPressed: () => print('Gift'),
                iconSize: 28,
                color: Colors.white,
                icon: Icon(Icons.card_giftcard)),
            IconButton(
                onPressed: () => print('Notifications'),
                iconSize: 28,
                color: Colors.white,
                icon: Icon(Icons.notifications)),
          ],
        ),
      )
    ]));
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const _AppBarButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
        ));
  }
}
