import 'dart:io';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  final VoidCallback onReset;

  const Setting({required this.onReset});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/greenScreen.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(5000, 0, 5000, 0),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Resume",
                        style: TextStyle(
                          fontSize: size.width / 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: size.height / 10,
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/woodButton.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    widget.onReset();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Restart",
                        style: TextStyle(
                          fontSize: size.width / 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: size.height / 10,
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/woodButton.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(200),
                  onTap: () {
                    exit(0);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Exit",
                        style: TextStyle(
                          fontSize: size.width / 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: size.height / 10,
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/woodButton.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
