import 'package:dmms/CustomWidgets/NavigationDrawer.dart';
import 'package:dmms/Screens/MyPapers.dart';
import 'package:dmms/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _index=0;
  List<Widget> pagelist=[
    Home(),MyPapers(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));
    return Scaffold(
        body: pagelist[_index],
        drawer: NavDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey[800],
          showUnselectedLabels: true,
          elevation: 12,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey[800],
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                title: Text(
                  'Home',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.view_list,
                  color: Colors.grey[800],
                ),
                activeIcon: Icon(
                  Icons.view_list,
                  color: Colors.red,
                ),
                title: Text(
                  'My Papers',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pageview,
                  color: Colors.grey[800],
                ),
                activeIcon: Icon(
                  Icons.pageview,
                  color: Colors.red,
                ),
                title: Text(
                  'Solutions',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_to_queue,
                  color: Colors.grey[800],
                ),
                activeIcon: Icon(
                  Icons.add_to_queue,
                  color: Colors.red,
                ),
                title: Text(
                  'Join Series',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                )),
            //  BottomNavigationBarItem(icon: Icon(Icons.notifications,color:Colors.grey[800],),activeIcon: Icon(Icons.notifications,color:Colors.red,),title: Text('Notifications',overflow: TextOverflow.clip,)),
          ],
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
        )
    );
  }
}
