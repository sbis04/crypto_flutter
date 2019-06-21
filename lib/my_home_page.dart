import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_flutter/about.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> _colors = [
    Colors.pink,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.purple,
    Colors.green
  ];
  List data;
  final String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker";

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    this.getJsonResponse();
  }

  Future<String> getJsonResponse() async {
    var response = await http.get(Uri.encodeFull(cryptoUrl),
        headers: {"Accept": "application/json"});

    setState(() {
      var convertDatatoJson = jsonDecode(response.body);
      data = convertDatatoJson;
    });

    return "Success";
  }

  Future<String> _refresh() {
    return getJsonResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Coin Market"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: "Refresh",
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              Divider(
                color: Colors.pink,
              ),
              ListTile(
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 22),
                ),
                trailing: Icon(
                  Icons.account_circle,
                  size: 50,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => AboutPage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: _cryptoUI(data, _colors),
        ));
  }
}

Widget _cryptoUI(List currencies, List _colors) {
  return Container(
    child: ListView.builder(
      itemCount: currencies == null ? 0 : currencies.length,
      itemBuilder: (BuildContext context, int index) {
        final Map currency = currencies[index];
        final Color color = _colors[index % _colors.length];
        return getListItemUi(currency, color);
      },
    ),
  );
}

Widget getListItemUi(Map currency, Color color) {
  return ListTile(
    leading: CircleAvatar(
      radius: 28,
      backgroundColor: color,
      child: Text(
        currency["name"][0],
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ),
    title: Text(
      currency["name"] + " (" + currency["symbol"] + ")",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    subtitle:
        _getSubtitle(currency["price_usd"], currency["percent_change_24h"]),
    isThreeLine: true,
  );
}

Widget _getSubtitle(String priceUsd, String percentageChange) {
  TextSpan priceTextWidget =
      TextSpan(text: "\$ $priceUsd\n", style: TextStyle(color: Colors.black));
  String percentageChangeText = "Change(24h): $percentageChange";

  TextSpan percentChangeTextWidget;

  if (double.parse(percentageChange) > 0) {
    percentChangeTextWidget = TextSpan(
        text: percentageChangeText, style: TextStyle(color: Colors.green));
  } else {
    percentChangeTextWidget = TextSpan(
        text: percentageChangeText, style: TextStyle(color: Colors.red));
  }

  return RichText(
    text: TextSpan(children: [priceTextWidget, percentChangeTextWidget]),
  );
}
