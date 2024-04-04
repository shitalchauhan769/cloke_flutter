import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1a4066),
          appBar: AppBar(
            title:const Text("ClockScreen",style: TextStyle(fontSize: 20)),
          ),
          body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 210,
              width: 210,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black,
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
                  value: time.second/60,backgroundColor: Colors.grey,color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
        drawer: const Column(
          children: [
            Text("Drawer",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
          ],
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
