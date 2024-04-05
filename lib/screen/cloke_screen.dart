import 'dart:math';

import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  DateTime time = DateTime.now();
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: scaffoldkey,
      child: Scaffold(
        backgroundColor: Color(0xff1a4066),
        appBar: AppBar(
          title: const Text("ClockScreen", style: TextStyle(fontSize: 20)),
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.arrow_back_ios_new));
            },
          ),
        ),
        body: Center(
          child: Stack(
            children: [
              Stack(
                children: List.generate(
                  60,
                  (index) => Transform.rotate(
                    angle: (pi * 2 * index) / 60,
                    child: Divider(
                      thickness: 2,
                      endIndent: index%5==0?MediaQuery.sizeOf(context).width * 0.90:MediaQuery.sizeOf(context).width * 0.95,
                      color: index%5==0?Colors.red:Colors.black,
                    ),
                  ),
                ),
              ),
              //hour
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: ((pi*2)*time.hour)/12,
                  child: Divider(
                    thickness: 6,
                    indent: 35,
                    endIndent: MediaQuery.sizeOf(context).width*0.50,
                    color: Colors.orange,
                  ),
                ),
              ),
              //minute
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: ((pi*2)*time.minute)/60,
                  child: Divider(
                    thickness: 3,
                    indent: 19,
                    endIndent: MediaQuery.sizeOf(context).width*0.50,
                    color: Colors.green,
                  ),
                ),
              ),
              //seconds
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: ((pi*2)*time.second)/60,
                  child: Divider(
                    thickness: 3,
                    endIndent: MediaQuery.sizeOf(context).width*0.50,
                    color: Colors.red,
                  ),
                ),
              ),

              //digital Clock
              Visibility(
                visible: false,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 210,
                      width: 210,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${time.hour}:${time.minute}:${time.second}",
                              style: const TextStyle(
                                  fontSize: 40,
                                  color: Color(0xff00f2f8),
                                  fontWeight: FontWeight.bold)),
                          Text("${time.day}/${time.month}/${time.year}",
                              style: const TextStyle(
                                  fontSize: 21,
                                  color: Color(0xff00f2f8),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Center(
                      child: Transform.scale(
                        scale: 6.50,
                        child: CircularProgressIndicator(
                          value: time.second / 60,
                          backgroundColor: Colors.grey,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("DrvearScreen",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
              ),
              const SizedBox(
                height: 5,
              ),
              const Column(
                children: [
                  Text(
                    "profile name",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40,),
                  Icon(Icons.watch_later_outlined,color: Colors.white),
                  Text(
                    "Digital Clocke",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return const Placeholder();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_time();
  }

  void get_time() {
    setState(() {
      time = DateTime.now();
    });
    Future.delayed(Duration(seconds: 1), () {
      get_time();
    });
  }
}
