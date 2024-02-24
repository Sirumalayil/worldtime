import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';
  
  void setupWorldTime() async {
    WorldTime timeInstance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await timeInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': timeInstance.time,
      'flag': timeInstance.flag,
      'location': timeInstance.location,
      'isDayTime': timeInstance.isDayTime
    });
    print(timeInstance.time);
    setState(() {
      time = timeInstance.time.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.red,
          size: 50.0,
        ),
      ),
    );
  }
}
