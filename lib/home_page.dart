import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.walletId});

  final String walletId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          toolbarHeight: 56,
          iconTheme: IconThemeData(color: Colors.grey[850]),
          backgroundColor: Colors.greenAccent,
          shadowColor: Colors.black,
          centerTitle: true,
          title: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(
              Icons.gamepad,
              color: Colors.grey[850],
            ),
            Text(
              "ANMANOFIVE",
              style: TextStyle(color: Colors.grey[850]),
            )
          ]),
        ),
        drawer: Drawer(
          width: 300.00,
          backgroundColor: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                  height: 200.0,
                  child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                      ),
                      child: Column(children: [
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.gamepad,
                                size: 50.00,
                                color: Colors.grey[850],
                              ),
                              Text(
                                "ANMANOFIVE",
                                style: TextStyle(
                                    color: Colors.grey[850], fontSize: 25.00),
                              )
                            ]),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 0),
                            child: Text(
                              widget.walletId.toString(),
                              style: TextStyle(
                                  color: Colors.grey[850], fontSize: 10),
                            ))
                      ]))),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.greenAccent,
                ),
                title: const Text(
                  'Welcome',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onTap: () => {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.supervised_user_circle,
                  color: Colors.greenAccent,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onTap: () => {Navigator.of(context).pop()},
              ),
            ],
          ),
        ),
        body: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text(
                widget.walletId.toString(),
                style: const TextStyle(color: Colors.greenAccent),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 210.00,
                    height: 200.00,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                              width: 100.00,
                              height: 100.00,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  onPressed: () => {print("Game 1")},
                                  child: const Text("Game 1"))),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                              width: 100.00,
                              height: 100.00,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  onPressed: () => {print("Game 2")},
                                  child: const Text("Game 2"))),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                              width: 100.00,
                              height: 100.00,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  onPressed: () => {print("Game 3")},
                                  child: const Text("Game 3"))),
                        )
                      ],
                    ),
                  ))
            ])));
  }
}
