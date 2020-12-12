import 'package:flutter/material.dart';
import 'package:hello/widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<String> _icons = ["p", "b", "w", "v"];
  Widget _buildText(int index) {
    return GestureDetector(
        onTap: () {
          setState(() => {_selectedIndex = index});
        },
        child: Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Theme.of(context).accentColor
                    : Color(0xFFE7EBEE),
                borderRadius: BorderRadius.circular(30.0)),
            child: Text(_icons[index])));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 80.0),
            child: Text('what whould you like to add',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(height: 20.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildText(map.key),
                  )
                  .toList()),
          SizedBox(height: 20.0),
          DestinationCarousel(),
        ])));
  }
}
