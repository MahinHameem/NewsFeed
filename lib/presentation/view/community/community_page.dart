import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  final bool themeStatus;
  const CommunityPage({Key? key, required this.themeStatus}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeStatus ? Colors.black : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('Community',
                style: TextStyle(
                  color: widget.themeStatus?Colors.white:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 10,),

              Text('Engage with the Virtual News Community and play a pivotal role in enhancing the collective experience of our members and readers. We invite you to contribute by sharing your unique news feeds, thereby enriching our community with diverse perspectives and insights.',
                style: TextStyle(
                  color: widget.themeStatus?Colors.white:Colors.black,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10,),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set the border radius here
                    ),
                    primary: Colors.cyan, // Set the background color to cyan
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.money),
                      Text('Contribute',),
                    ],
                  )),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set the border radius here
                    ),
                    primary: Colors.cyan, // Set the background color to cyan
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.article),
                      Text('Create Account',),
                    ],
                  )),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set the border radius here
                    ),
                    primary: Colors.green, // Set the background color to cyan
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.key),
                      Text('Login',),
                    ],
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
