import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class testApp extends StatefulWidget {
  @override
  _testAppState createState() => _testAppState();
}

class _testAppState extends State<testApp> {
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: new AppBar(
        title: new Text('Test'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image(
              image: AssetImage('assets/i1.jpg'),
              height: 90,
              width: 100,
            );

          },
          itemCount: 8,
          containerHeight: 100,
          control: new SwiperControl(color: Colors.red),
          viewportFraction: 0.3,

        ),
      ),
    );
  }
}
