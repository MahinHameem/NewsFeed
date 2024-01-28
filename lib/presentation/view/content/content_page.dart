import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentViewPage extends StatefulWidget {
  final bool themeStatus;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const ContentViewPage(
      {Key? key,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content, required this.themeStatus})
      : super(key: key);

  @override
  State<ContentViewPage> createState() => _ContentViewPageState();
}

class _ContentViewPageState extends State<ContentViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeStatus?Colors.black:Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.cyan
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            // Icon(
            //   Icons.newspaper,
            //   color: Color(0xff2acec8),
            // ),
            Text(
              'View Content',
              style: TextStyle(
                color: widget.themeStatus?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(
                    child: Text(widget.author,
                    style: TextStyle(
                      color:  widget.themeStatus?Colors.cyanAccent:Colors.cyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Text(widget.title,
                style: TextStyle(
                  color:  widget.themeStatus?Colors.white:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10,),

              Image(image: NetworkImage(widget.urlToImage)),


              SizedBox(height: 10,),

              Text(widget.content,
                style: TextStyle(
                  color:  widget.themeStatus?Colors.white:Colors.black,
                  fontSize: 15,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  color:  widget.themeStatus?Colors.cyanAccent:Colors.cyan,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(onPressed: (){
                  redirectToGoogle(widget.url);
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Visit Website',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    ),
                  ],
                )),
              ),

            ],
          ),
        ),
      ),

    );
  }
}


void redirectToGoogle(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}