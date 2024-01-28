import 'package:flutter/material.dart';
import 'package:news_feed_app/presentation/view/community/community_page.dart';

class SettingsPage extends StatefulWidget {
  final bool themeStatus;

  const SettingsPage({Key? key, required this.themeStatus}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeStatus ? Colors.black : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('Settings',
              style: TextStyle(
                color: widget.themeStatus?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              ),

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
                      Icon(Icons.account_box),
                      Text('Account Settings',),
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
                      Icon(Icons.privacy_tip_outlined),
                      Text('Privacy Policy',),
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
                      Icon(Icons.attach_money_outlined),
                      Text('Donate',),
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
                      Icon(Icons.info),
                      Text('Info',),
                    ],
                  )),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set the border radius here
                    ),
                    primary: Colors.green, // Set the background color to cyan
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => CommunityPage(themeStatus: widget.themeStatus),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.people),
                      Text('Community',),
                    ],
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
