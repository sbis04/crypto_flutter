import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  _launchURL(launchUrl) async {
    if (await canLaunch(launchUrl)) {
      await launch(launchUrl);
    } else {
      throw 'Could not launch $launchUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 80,
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Text(
              "Developer Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 4)),
            Text(
              "Souvik Biswas",
              style: TextStyle(
                color: Colors.purple[600],
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "Contact Info",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Email: ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[600]),
                  // "Website: souvikbiswas.com\n",
                ),
                Text(
                  "sbis1999@gmail.com",
                  style: TextStyle(fontSize: 20),
                  // "Website: souvikbiswas.com\n",
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Website: ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[600]),
                  // "Website: souvikbiswas.com\n",
                ),
                InkWell(
                  onTap: () => _launchURL('https://www.souvikbiswas.com'),
                  child: Text(
                    "souvikbiswas.com",
                    style: TextStyle(fontSize: 20),
                    // "Website: souvikbiswas.com\n",
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Twitter: ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[600]),
                  // "Website: souvikbiswas.com\n",
                ),
                InkWell(
                  onTap: () => _launchURL('https://twitter.com/sbis04'),
                  child: Text(
                    "@sbis04",
                    style: TextStyle(fontSize: 20),
                    // "Website: souvikbiswas.com\n",
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Medium: ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[600]),
                  // "Website: souvikbiswas.com\n",
                ),
                InkWell(
                  onTap: () => _launchURL('https://medium.com/@sbis1999'),
                  child: Text(
                    "@sbis1999",
                    style: TextStyle(fontSize: 20),
                    // "Website: souvikbiswas.com\n",
                  ),
                ),
              ],
            ),
            SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}
