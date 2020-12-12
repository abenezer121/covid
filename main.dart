import 'package:flutter/material.dart';
import 'package:hello/screens/home_screen.dart';

//FractionallySizedBox
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7)),
      home: HomeScreen(),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  double screenWidth = 0.0;
  double toTheLeft = 10.0;
  double screenHeight = 0.0;
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    toTheLeft = MediaQuery.of(context).size.width * 0.10;
    // TODO: implement build
    return Scaffold(
      body: ListView(children: [
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              width: screenWidth,
              color: Color.fromRGBO(71, 63, 151, 5),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: (screenHeight * 0.05),
                          left: toTheLeft,
                          right: toTheLeft),
                      child: Text(
                        "Covid-19",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: toTheLeft),
                      child: Text("Are you feeling Sick?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.01, left: toTheLeft, right: 40),
                      child: Text(
                        "If you feel Sick with any of covid-19 symptoms please call or SmS us immediately for help",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: (screenHeight * 0.01),
                          bottom: (screenHeight * 0.07)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomBox(
                              color: Colors.red,
                              string: "Call Now",
                              icon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              )),
                          CustomBox(
                              color: Colors.blue,
                              string: "Send SmS",
                              icon: Icon(
                                Icons.message,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              child: Padding(
                padding:
                    EdgeInsets.only(left: ((screenWidth / 2) - (120 + 12))),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomSelect(text: "Global", color: Colors.grey),
                        SizedBox(width: 12),
                        CustomSelect(text: "Per Country", color: Colors.red),
                      ],
                    )),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(left: 0.5),
              child: CustomClass(
                  header: "CONFIRMED",
                  number: "878",
                  color: Colors.red,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth),
            ),
            CustomClass(
                header: "ACTIVE",
                number: "182122278",
                color: Colors.blue,
                screenHeight: screenHeight,
                screenWidth: screenWidth),
          ],
        ),
        SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomClass(
                header: "RECOVERED",
                number: "654",
                color: Colors.green,
                screenHeight: screenHeight,
                screenWidth: screenWidth),
            CustomClass(
                header: "DECEASED",
                number: "20",
                color: Colors.grey,
                screenHeight: screenHeight,
                screenWidth: screenWidth),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
    );
  }
}

class CustomClass extends StatelessWidget {
  final String header;
  final String number;
  final Color color;
  final double screenHeight;
  final double screenWidth;

  const CustomClass(
      {Key key,
      this.header,
      this.number,
      this.color,
      this.screenHeight,
      this.screenWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double cardHeight = 200;
    // TODO: implement build
    return Container(
        height: cardHeight,
        width: (screenWidth / 2) - 20,
        child: Card(
          child: Container(
              margin: EdgeInsets.only(top: (cardHeight * 0.3)),
              child: Column(
                children: [
                  Text(header,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    number,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )
                ],
              )),
        ));
  }
}

class CustomSelect extends StatelessWidget {
  final String text;
  final Color color;

  const CustomSelect({Key key, this.text, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        width: 120,
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
  }
}

class CustomBox extends StatelessWidget {
  final Color color;
  final String string;
  final Icon icon;

  const CustomBox({Key key, this.color, this.string, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 35, right: 5),
                child: Column(
                  children: [
                    icon,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, right: 35, left: 5),
                child: Center(
                  child: Text(
                    string,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

/*
    return Container(
        color: color,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Icon(Icons.menu),
          ],
        ));
        */
/*
class HomeScreen extends StatelessWidget {
  var Stringvalue = ["220,000", "For Sale", "3-4 Beds", ">1000 sqrt"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Icon(Icons.menu)),
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Icon(Icons.settings)),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("city"),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text("San Franscesco")),
          SizedBox(height: 10),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ChoiceOptions(text: Stringvalue[0]),
                ChoiceOptions(text: Stringvalue[1]),
                ChoiceOptions(text: Stringvalue[2]),
                ChoiceOptions(text: Stringvalue[3]),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return RealStateItem(itemData: "asdf");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChoiceOptions extends StatelessWidget {
  @override
  final String text;

  const ChoiceOptions({Key key, @required this.text}) : super(key: key);

  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.grey),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Text(text),
    );
  }
}

class RealStateItem extends StatelessWidget {
  final dynamic itemData;

  const RealStateItem({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 25),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset('assets/images/hotel1.jpg')),
              Positioned(top: 15, right: 15, child: Text("thi"))
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text("afdkjhaskdjsf"),
              SizedBox(height: 10),
              Text("afkfhaksjfhkjsahfakjfhkjasf"),
            ],
          ),
          Text(
            "4 bedrooms / 2 bathrooms / 144sqt",
            textAlign: TextAlign.center,
          ),
        ]));
  }
}

*/
/*
shrinkWrap: true,
*/
/*
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            child: Image.asset('assets/images/hotel0.jpg',
                width: 600, height: 240, fit: BoxFit.cover)),
        Container(
            padding: const EdgeInsets.all(32),
            color: Colors.green,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text("Hello There",
                              style: (TextStyle(
                                fontWeight: FontWeight.bold,
                              )))),
                      Text("aksdjfkashjljkasdf")
                    ],
                  ),
                ),
                Text("hi"),
                Text("hi")
              ],
            )),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("this text"), Text("That Text")],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("this text"), Text("That Text")],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("this text"), Text("That Text")],
            )
          ],
        )),
        Container(
          padding: const EdgeInsets.all(32),
          child: Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true,
          ),
        )
      ],
    ));
  }
}

*/
