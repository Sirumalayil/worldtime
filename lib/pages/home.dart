import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data = {};

  @override
  Widget build(BuildContext context) {
    data = data!.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map?;
    print(data);

    String bgImage = data?['isDayTime'] ? 'day.png' : 'night.png';
    Color textColor = data?['isDayTime'] ? Colors.white : Colors.blue;
    Color bgColor = data?['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime']
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data?['location'],
                        style: TextStyle(
                          fontSize: 32.0,
                          letterSpacing: 2.0,
                          color: textColor
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data?['time'],
                    style: TextStyle(fontSize: 66.0,color: textColor),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
