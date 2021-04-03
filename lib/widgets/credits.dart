import 'package:flutter/material.dart';
import 'package:portfolio/presentation/app_icons.dart';
import 'dart:html' as html;

class Credits extends StatefulWidget {
  @override
  _CreditsState createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  final String _githubUrl = "https://github.com/alpharaoh/Quadtree-Compression";
  final String _linkedinUrl =
      "https://www.linkedin.com/in/akaam-shamerany-b3917b1a4/";
  final String _twitterUrl = "https://twitter.com/VadeEcon";

  void _launchUrl(String url) async {
    html.window.open(url, "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            bottom: 10.0,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.025),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "CREATED BY: ",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      "Akaam Shamerany",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Container(
                  width: 150.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: MaterialButton(
                          child: Icon(
                            AppIcons.mark_github,
                            size: 20.0,
                          ),
                          shape: CircleBorder(),
                          color: Color.fromARGB(255, 6, 6, 6),
                          onPressed: () => _launchUrl(_githubUrl),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: MaterialButton(
                          child: Icon(
                            AppIcons.linkedin,
                            size: 15.0,
                          ),
                          shape: CircleBorder(),
                          color: Color.fromARGB(255, 6, 6, 6),
                          onPressed: () => _launchUrl(_linkedinUrl),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        child: MaterialButton(
                          child: Icon(
                            AppIcons.twitter,
                            size: 15.0,
                          ),
                          shape: CircleBorder(),
                          color: Color.fromARGB(255, 6, 6, 6),
                          onPressed: () => _launchUrl(_twitterUrl),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Divider(
            //   height: 10.0,
            // ),
          ],
        ));
  }
}
