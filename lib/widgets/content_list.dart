import 'package:flutter/material.dart';
import 'package:netflix_flutter/models/models.dart';
import 'package:netflix_flutter/widgets/widgets.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;
  final bool isMovie;
  const ContentList({
    Key? key,
    required this.title,
    required this.contentList,
    required this.isMovie,
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
              horizontal: 20,
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
            height: isOriginals ? 350 : 220,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contentList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Content content = contentList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Preview(content: content, isMovie: isMovie))),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            content.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      height: isOriginals ? 350 : 200,
                      width: isOriginals ? 200 : 130,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
