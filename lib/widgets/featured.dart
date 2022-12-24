import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_flutter/models/models.dart';

import '../assets.dart';

class Featured extends StatelessWidget {
  final List<Content> contentList;
  Featured({
    super.key,
    required this.contentList,
  });
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 450,
        disableCenter: true,
        pageViewKey: PageStorageKey('Carousel'),
        enableInfiniteScroll: false,
        autoPlay: false,
        autoPlayInterval: Duration(
          seconds: 5,
        ),
        enlargeCenterPage: true,
      ),
      itemCount: contentList.length,
      itemBuilder: (context, index, realIndex) {
        final content = contentList[index];
        return Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              content.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              top: 12,
            ),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                Assets.netflixLogo0,
              ),
            ),
          ),
        ]);
      },
    );
  }
}
