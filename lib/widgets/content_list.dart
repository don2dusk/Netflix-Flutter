import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;
  const ContentList({
    Key? key,
    required this.title,
    required this.contentList,
    this.isOriginals = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: isOriginals ? 500 : 220,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contentList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Content content = contentList[index];
                  return GestureDetector(
                    onTap: () => print(title),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      height: isOriginals ? 400 : 200,
                      width: isOriginals ? 200 : 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            content.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
