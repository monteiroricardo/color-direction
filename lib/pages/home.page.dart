import 'package:colors_direction/components/lis.colors.dart';

import 'package:colors_direction/pages/expanded.page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

int _selectedIndex = 0;

String fix = '0xff';
String cor1 = 'F44336';
String code1 = '$fix$cor1';
String cor2 = 'FF9800';
String code2 = '$fix$cor2';
TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();

class _HomePageState extends State<HomePage> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff37414F),
          contentPadding: EdgeInsets.all(0),
          buttonPadding: EdgeInsets.all(0),
          actionsPadding: EdgeInsets.all(0),
          insetPadding: EdgeInsets.all(0),
          titlePadding: EdgeInsets.all(0),
          content: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    height: 120,
                    color: Color(int.parse(code1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '#$cor1',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'hero'),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: 25,
                          width: double.infinity,
                          child: TextField(
                            maxLength: 6,
                            decoration: InputDecoration(counterText: ''),
                            textAlign: TextAlign.center,
                            controller: controller1,
                          ),
                        ),
                      ],
                    )),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    height: 120,
                    color: Color(int.parse(code2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '#$cor2',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'hero'),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: 25,
                          width: double.infinity,
                          child: TextField(
                            maxLength: 6,
                            decoration: InputDecoration(counterText: ''),
                            textAlign: TextAlign.center,
                            controller: controller2,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Apply',
                style: TextStyle(color: Colors.white, fontFamily: 'hero'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  if (controller1.text.contains(RegExp('[G-Zg-z]'))) {
                    setState(() {
                      controller1.text = 'ffffff';
                    });
                  }
                  cor1 = controller1.text;
                  code1 = '$fix$cor1';
                  cores[0] = Color(int.parse(code1));
                });
                setState(() {
                  if (controller2.text.contains(RegExp('[G-Zg-z]'))) {
                    setState(() {
                      controller2.text = 'ffffff';
                    });
                  }
                  cor2 = controller2.text;
                  code2 = '$fix$cor2';
                  cores[1] = Color(int.parse(code2));
                });
              },
            )
          ],
        );
      },
    );
  }

  var _begin = Alignment.centerLeft;
  var _end = Alignment.bottomCenter;
  void _selectedPosition() {
    switch (_selectedIndex) {
      case 0:
        return this.setState(() {
          _begin = Alignment.topCenter;
          _end = Alignment.bottomCenter;
        });
        break;
      case 1:
        return this.setState(() {
          _begin = Alignment.centerLeft;
          _end = Alignment.centerRight;
        });
        break;
      case 2:
        return this.setState(() {
          _begin = Alignment.centerRight;
          _end = Alignment.centerLeft;
        });
        break;
      case 3:
        return this.setState(() {
          _begin = Alignment.bottomCenter;
          _end = Alignment.topCenter;
        });
        break;
      case 4:
        return this.setState(() {
          _begin = Alignment.bottomLeft;
          _end = Alignment.topRight;
        });
        break;
      case 5:
        return this.setState(() {
          _begin = Alignment.bottomRight;
          _end = Alignment.topLeft;
        });
        break;
      case 6:
        return this.setState(() {
          _begin = Alignment.topLeft;
          _end = Alignment.bottomRight;
        });
        break;
      case 7:
        return this.setState(() {
          _begin = Alignment.topRight;
          _end = Alignment.bottomLeft;
        });
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    controller1.text = cor1;
    controller2.text = cor2;
  }

  @override
  Widget build(BuildContext context) {
    _selectedPosition();

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                leading: Column(
                  children: [
                    InkWell(
                      onTap: () => _showMyDialog(),
                      child: Image.asset(
                        'assets/images/color-circle.png',
                        height: 50,
                      ),
                    ),
                    Text(
                      'hex color',
                      style: TextStyle(color: Colors.white, fontFamily: 'hero'),
                    )
                  ],
                ),
                labelType: NavigationRailLabelType.none,
                groupAlignment: 1,
                backgroundColor: Colors.black,
                selectedIconTheme: IconThemeData(color: Colors.white),
                unselectedIconTheme: IconThemeData(color: Colors.white24),
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(FontAwesomeIcons.arrowDown),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Icon(FontAwesomeIcons.arrowRight),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Icon(FontAwesomeIcons.arrowLeft),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Icon(FontAwesomeIcons.arrowUp),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Transform.rotate(
                      angle: 1,
                      child: Icon(FontAwesomeIcons.arrowUp),
                    ),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Transform.rotate(
                      angle: -1,
                      child: Icon(FontAwesomeIcons.arrowUp),
                    ),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Transform.rotate(
                      angle: 2.5,
                      child: Icon(FontAwesomeIcons.arrowUp),
                    ),
                    label: Text(''),
                  ),
                  NavigationRailDestination(
                    icon: Transform.rotate(
                      angle: -2.5,
                      child: Icon(FontAwesomeIcons.arrowUp),
                    ),
                    label: Text(''),
                  ),
                ],
                elevation: 5,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: _begin,
                      end: _end,
                      colors: cores.toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ExpandedPage(_begin, _end))),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          maxRadius: 30,
          child: Icon(
            FontAwesomeIcons.expand,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
