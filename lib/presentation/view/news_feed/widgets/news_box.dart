import 'package:flutter/material.dart';

class NewsBoxWidget extends StatefulWidget {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final VoidCallback viewClick;
  final Color authorColor;
  final Color titleColor;
  final Color descriptionTextColor;
   final Color descriptionColor;
   final Color containerColor;




  const NewsBoxWidget(
      {Key? key,
        required this.containerColor,
        required this.authorColor,
        required this.descriptionColor,
        required this.descriptionTextColor,
        required this.titleColor,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      required this.viewClick})
      : super(key: key);

  @override
  State<NewsBoxWidget> createState() => _NewsBoxWidgetState();
}

class _NewsBoxWidgetState extends State<NewsBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.containerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person, color: widget.authorColor),
                  Expanded(
                    child: Text(
                      widget.author,
                      style: TextStyle(
                        color: widget.authorColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Icon(Icons.bookmark_add_outlined, color: widget.authorColor),
                ],
              ),
              Text(
                widget.title,
                style:
                    TextStyle(color: widget.titleColor, fontWeight: FontWeight.bold),
              ),
              Image(image: NetworkImage(widget.urlToImage)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Description:',
                    style: TextStyle(
                        color: widget.descriptionTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                widget.description,
                style: TextStyle(
                  color: widget.descriptionTextColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Published at: ${widget.publishedAt}',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_up_alt_outlined),
                    color: widget.descriptionTextColor,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.viewClick();
                    },
                    child: Text('View'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the value for desired roundness
                      ),
                      primary: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
