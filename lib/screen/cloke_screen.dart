import 'package:flutter/material.dart';

class ClokeScreen extends StatefulWidget {
  const ClokeScreen({super.key});

  @override
  State<ClokeScreen> createState() => _ClokeScreenState();
}

class _ClokeScreenState extends State<ClokeScreen> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1a4066),
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
      )),
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
