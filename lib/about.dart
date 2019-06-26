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
                  color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(top: 4)),
            Text(
              "Souvik Biswas",
              style: Theme.of(context).textTheme.headline,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "Contact Info",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Email: ",
                  style: Theme.of(context).textTheme.body1,
                  // "Website: souvikbiswas.com\n",
                ),
                Text(
                  "sbis1999@gmail.com",
                  style: Theme.of(context).textTheme.body2,
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
                  style: Theme.of(context).textTheme.body1,
                  // "Website: souvikbiswas.com\n",
                ),
                InkWell(
                  onTap: () => _launchURL('https://www.souvikbiswas.com'),
                  child: Text(
                    "souvikbiswas.com",
                    style: Theme.of(context).textTheme.body2,
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
                  style: Theme.of(context).textTheme.body1,
                  // "Website: souvikbiswas.com\n",
                ),
                InkWell(
                  onTap: () => _launchURL('https://twitter.com/sbis04'),
                  child: Text(
                    "@sbis04",
                    style: Theme.of(context).textTheme.body2,
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
                  style: Theme.of(context).textTheme.body1,
                  // "Website: souvikbiswas.com\n",
                ),
                InkWell(
                  onTap: () => _launchURL('https://medium.com/@sbis1999'),
                  child: Text(
                    "@sbis1999",
                    style: Theme.of(context).textTheme.body2,
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
