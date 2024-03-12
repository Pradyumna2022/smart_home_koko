import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_smart_home/utils/smart_devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 25;

  final double verticalPadding = 10;

  List smartDevices = [
    // smartDevicesName, imagePath,powerStatus
    ['Smart Light', 'lib/icons/light.png', true],
    ['Smart AC', 'lib/icons/air.png', false],
    ['Smart TV', 'lib/icons/smart-tv.png', false],
    ['Smart Fan', 'lib/icons/fan.png', false],
  ];
  void powerSwichedChanged(bool value, int index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //custom app bar
              //1. menu icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    width: 25,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.grey[800],
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Welcome Home",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Text(
                "PRADYUMNA V....",
                style: GoogleFonts.bebasNeue(fontSize: 53),
              ), //smart devices + grid items

              Divider(
                thickness: 2,
                color: Colors.grey[200],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Smart Devices",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.only(top: 15),
                      itemCount: smartDevices.length,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1 / 1.2),
                      itemBuilder: (context, index) {
                        return SamrtDevicesTiles(
                          iconPath: smartDevices[index][1].toString(),
                          powerOn: smartDevices[index][2],
                          smartDevicesName: smartDevices[index][0].toString(),
                          onChanged: (value) {
                            powerSwichedChanged(value, index);
                          },
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
