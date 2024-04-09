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
  bool Isdigital = false;
  bool Isanulog = false;
  bool Isstrap = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: scaffoldkey,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("ClockScreen",),
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
            alignment: Alignment.center,
            children: [
              //Strop clock
              Visibility(
                visible: Isstrap,
                child: Stack(alignment: Alignment.center, children: [
                  //second
                  Container(
                    height: 260,
                    width: 260,
                    child: CircularProgressIndicator(
                      strokeWidth: 15,
                      value: time.second * 1 / 60,
                      color: Colors.pink,
                      backgroundColor: Colors.pink.withOpacity(0.2),
                    ),
                  ),
                  //minuet
                  Container(
                    height: 210,
                    width: 210,
                    child: CircularProgressIndicator(
                      value: time.minute * 1 / 60,
                      color: Colors.green,
                      backgroundColor: Colors.green.withOpacity(0.2),
                      strokeWidth: 15,
                    ),
                  ),
                  //hour
                  CircularProgressIndicator(
                    value: time.hour * 1 / 12,
                    color: Colors.yellow,
                    backgroundColor: Colors.yellow.withOpacity(0.2),
                    strokeWidth: 15,
                  ),


                ]),
              ),

              //analog clock
              Visibility(
                visible: Isanulog,
                child: Stack(
                  children: [
                    Stack(
                      children: List.generate(
                        60,
                            (index) => Transform.rotate(
                          angle: (pi * 2 * index) / 60,
                          child: Divider(
                            thickness: 2,
                            endIndent: index % 5 == 0
                                ? MediaQuery.sizeOf(context).width * 0.90
                                : MediaQuery.sizeOf(context).width * 0.95,
                            color: index % 5 == 0 ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi / 2,
                      child: Transform.rotate(
                        angle: ((pi * 2) * time.hour) / 12,
                        child: Divider(
                          thickness: 6,
                          indent: 35,
                          endIndent: MediaQuery.sizeOf(context).width * 0.50,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    //minute
                    Transform.rotate(
                      angle: pi / 2,
                      child: Transform.rotate(
                        angle: ((pi * 2) * time.minute) / 60,
                        child: Divider(
                          thickness: 3,
                          indent: 19,
                          endIndent: MediaQuery.sizeOf(context).width * 0.50,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    //seconds
                    Transform.rotate(
                      angle: pi / 2,
                      child: Transform.rotate(
                        angle: ((pi * 2) * time.second) / 60,
                        child: Divider(
                          thickness: 3,
                          endIndent: MediaQuery.sizeOf(context).width * 0.50,
                          color: Colors.red,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              //digital Clock
              Visibility(
                visible: Isdigital,
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
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade300),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("profilename",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                 Row(
                  children: [
                    const Text(
                      "Digital clock",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          setState(
                                () {
                              Isstrap = false;
                              Isanulog = false;
                              Isdigital = true;
                            },
                          );
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.black,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                 Row(
                  children: [
                    const Text(
                      "Analog clock",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          setState(
                                () {
                              Isstrap = false;
                              Isanulog = true;
                              Isdigital = false;
                            },
                          );
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.black,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      "Strap clock",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              Isstrap = true;
                              Isanulog = false;
                              Isdigital = false;
                            },
                          );
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.black,
                        ))
                  ],
                ),
              ],
            ),
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
