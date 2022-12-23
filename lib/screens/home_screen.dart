import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      key: PageStorageKey('Tab Controller'),
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            SafeArea(
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
                      onTap: () => _scaffoldKey.currentState!.openDrawer(),
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
            ),
            Padding(padding: EdgeInsets.all(25)),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
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
            Padding(padding: EdgeInsets.all(20)),
            TabBar(
                key: PageStorageKey('Tab Bar'),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.fromLTRB(30, -15, 30, -15),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(236, 226, 18, 42),
                ),
                tabs: [
                  Text(
                    'TV Shows',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Movies',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Scaffold(
                body: TabBarView(key: PageStorageKey('Tab Ba'), children: [
                  CustomScrollView(
                    key: PageStorageKey('Scroll View'),
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 20),
                        sliver: SliverToBoxAdapter(
                          child: Featured(
                            contentList: originals,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ContentList(
                          key: PageStorageKey('My List'),
                          title: 'New Releases',
                          contentList: trending,
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
                            isOriginals: true,
                          ),
                        ),
                      )
                    ],
                  ),
                  CustomScrollView(
                    key: PageStorageKey('Scroll Vie'),
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.only(top: 20),
                        sliver: SliverToBoxAdapter(
                          child: Featured(
                            contentList: previews,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ContentList(
                          key: PageStorageKey('My Lis'),
                          title: 'New Releases',
                          contentList: myList,
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(
                          bottom: 20,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: ContentList(
                            key: PageStorageKey('Trendin'),
                            title: 'Trending',
                            contentList: trending,
                            isOriginals: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        key: PageStorageKey('Drawer'),
        backgroundColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    Assets.netflixLogo0,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            _buildMenuItems(context)
          ],
        ),
      );
}

Widget _buildMenuItems(BuildContext context) => Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.add_circle_rounded,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            'Recently Added',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => print('Recently Added'),
        ),
        ListTile(
          leading: Icon(
            Icons.tv_rounded,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            'Coming Soon',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => print('Coming Soon'),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Divider(
            thickness: 1,
            color: Colors.grey[850],
          ),
        ),
        ListTile(
          leading: Icon(
            Iconsax.setting_2,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => print('Settings'),
        ),
        ListTile(
          leading: Icon(
            Iconsax.note5,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            'My List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => print('My List'),
        ),
        ListTile(
          leading: Icon(
            Icons.download_rounded,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            'Downloads',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => print('My List'),
        ),
      ],
    );
