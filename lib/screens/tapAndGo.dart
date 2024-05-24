import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TapAndGo extends StatefulWidget {
  const TapAndGo({super.key});

  @override
  State<TapAndGo> createState() => _TapAndGoState();
}

class _TapAndGoState extends State<TapAndGo> {
  void _launchURL() async {
  const url = 'https://www.instagram.com/ridhu__n?igsh=bHpxdzhoOXh6NTdk';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:   Center(
        child: GestureDetector(
          onTap: _launchURL,
          child: Text(
            'Tap here to open Instagram',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}