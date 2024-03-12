import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SamrtDevicesTiles extends StatelessWidget {
  final String smartDevicesName;
  final String iconPath;
  final bool powerOn;
  final void Function(bool)? onChanged;
  const SamrtDevicesTiles(
      {super.key,
      required this.iconPath,
      required this.powerOn,
      required this.smartDevicesName,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: powerOn ? Colors.black : Colors.grey[200],
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath,
              scale: 10,
              color: powerOn ? Colors.white : Colors.black,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  smartDevicesName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: powerOn ? Colors.white : Colors.black,
                  ),
                )),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(value: powerOn, onChanged: onChanged),
                )
              ],
            )
          ],
        ));
  }
}
