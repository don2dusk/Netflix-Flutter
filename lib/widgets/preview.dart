import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_flutter/assets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Preview extends StatefulWidget {
  final content;
  final bool isMovie;
  const Preview({
    super.key,
    required this.content,
    required this.isMovie,
  });

  @override
  State<Preview> createState() => _PreviewState();
}

final List episodes = [
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
];

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
          minHeight: size.height / 2.1,
          maxHeight: size.height / 2.1,
          borderRadius: BorderRadius.circular(40),
          panel: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Scaffold(
                backgroundColor: Color.fromARGB(255, 11, 11, 26),
                floatingActionButton: Align(
                  alignment: Alignment(1, -1.2),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 227, 29, 18),
                      onPressed: () => print('Play'),
                      child: Icon(
                        Iconsax.play4,
                      ),
                    ),
                  ),
                ),
                body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 15),
                      ExpandableText(
                        'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum',
                        expandText: 'Learn More',
                        animation: true,
                        expanded: widget.isMovie ? true : false,
                        collapseText: widget.isMovie ? '' : 'See less',
                        linkStyle: TextStyle(color: Colors.red),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.isMovie ? '' : 'More Episodes',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      //SizedBox(height: 30),
                      widget.isMovie == false
                          ? Expanded(child: episodeList())
                          : Container(),
                    ]),
              ),
            ),
          ),
          color: Color.fromARGB(255, 11, 11, 26),
          body: Stack(children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                widget.content.imageUrl,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  stops: [0.45, 1],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, top: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: MaterialButton(
                      onPressed: () => Navigator.pop(context),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Icon(
                        Iconsax.heart4,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 170,
                  left: 15,
                ),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    Assets.netflixLogo0,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  bottom: 40,
                  right: 20,
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.content.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ])),
    );
  }

  Widget episodeList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          final episode = episodes[index];
          return Column(
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 2, bottom: 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: AspectRatio(
                            aspectRatio: 1.1,
                            child: Image.asset(
                              widget.content.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            'Episode - $episode',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                              iconSize: 35,
                              onPressed: () => print('Play'),
                              icon: Icon(
                                Iconsax.play_circle4,
                                color: Color.fromARGB(232, 245, 30, 20),
                              )),
                        )
                      ]),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(156, 51, 51, 61),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          );
        });
  }
}
