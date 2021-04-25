import 'package:flutter/material.dart';
import 'package:project_bin/Checklist/activity.dart';
import 'package:project_bin/Widget-Other/BottomBar.dart';
import 'package:project_bin/Widget-Other/Drawer.dart';

class Checklist1 extends StatefulWidget {
  @override
  _Checklist1State createState() => _Checklist1State();
}

class _Checklist1State extends State<Checklist1> {
  List<bool> pressed = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawerEnableOpenDragGesture: false,
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: DrawMenu1(),
      ),
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Builder(
                builder: (context) => IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                    ))),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Builder(
                builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ))),
          )
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'ขยะลุ้นทอง',
          style: TextStyle(
              fontFamily: 'Kanit',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        backgroundColor: Colors.lightGreen.shade800,
      ),
      body: SingleChildScrollView(
              child: Container(
          color: Colors.white,
          child: Column(
            children: [
              //เอาไว้ใส่รูปแถบด้านบน
              Container(
                height: 90,
                child: Row(
                  children: [
                    Image(
                      width: MediaQuery.of(context).size.width/2,
                      image: new AssetImage("images/gold.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                    Image(
                      width: MediaQuery.of(context).size.width/2,
                      image: new AssetImage("images/bin.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              //แถบประจำเดือน
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Colors.grey.shade300, width: 4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                        )),
                    Text(
                      'ประจำเดือน มีนาคม',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
              ),
              //icon 3 อันกดแล้วเปลี่ยนสี
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipOval(
                      child: Material(
                        color: pressed[0] ? Colors.orange : Colors.lightGreen,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                pressed[0] = true;
                                pressed[1] = false;
                                pressed[2] = false;
                              });
                            },
                            splashColor: Colors.orange,
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.app_registration,
                                  size: 40,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: pressed[1] ? Colors.orange : Colors.lightGreen,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                pressed[0] = false;
                                pressed[1] = true;
                                pressed[2] = false;
                              });
                            },
                            splashColor: Colors.orange,
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.receipt,
                                  size: 40,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: pressed[2] ? Colors.orange : Colors.lightGreen,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                pressed[0] = false;
                                pressed[1] = false;
                                pressed[2] = true;
                              });
                            },
                            splashColor: Colors.orange,
                            child: Container(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.card_giftcard_rounded,
                                  size: 40,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
              //ตัวอักษรใต้ icon
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'กิจกรรม',
                      style: TextStyle(fontFamily: 'Kanit', fontSize: 14),
                    ),
                    Text(
                      'ตั๋วลุ้นทอง',
                      style: TextStyle(fontFamily: 'Kanit', fontSize: 14),
                    ),
                    Text(
                      'รางวัล',
                      style: TextStyle(fontFamily: 'Kanit', fontSize: 14),
                    ),
                  ],
                ),
              ),
              // body คุณได้รับตั๋ว...
              Container(
                  child: pressed[0]
                      ? Activity()
                      : pressed[1]
                          ? Container()
                          : Container()),
            ],
          ),
        ),
      ),
    );
  }
}
