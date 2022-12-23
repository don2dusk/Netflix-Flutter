import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
        context.read<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
              child: SafeArea(
            child: SizedBox(
              height: 50,
              width: screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Icon(
                      Iconsax.menu_1,
                      color: Colors.grey[300],
                      size: 40,
                    ),
                    onTap: () => print('Menu'),
                  ),
                  Image.asset(
                    Assets.netflixLogo1,
                    scale: 7.5,
                  ),
                  GestureDetector(
                    onTap: () => print('Notification'),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Iconsax.notification4,
                        color: Colors.white70,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromRGBO(38, 38, 49, 100)),
                    ),
                  )
                ],
              ),
            ),
          )),
          SliverPadding(padding: EdgeInsets.all(25)),
          SliverPadding(
            padding: EdgeInsets.only(left: 40, right: 40),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 60,
                child: TextField(
                  style: TextStyle(
                      color: Colors.grey[300], fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.search_normal_1,
                      color: Colors.grey[300],
                    ),
                    suffixIcon:
                        Icon(Iconsax.microphone_2, color: Colors.grey[300]),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(38, 38, 49, 100),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: Color.fromRGBO(38, 38, 49, 100),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Search here...',
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
                child: Previews(
              key: PageStorageKey('Previews'),
              title: 'Previews',
              contentList: previews,
            )),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('My List'),
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('Originals'),
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('Trending'),
                title: 'Trending',
                contentList: trending,
              ),
            ),
          )
        ],
      ),
    );
  }
}
