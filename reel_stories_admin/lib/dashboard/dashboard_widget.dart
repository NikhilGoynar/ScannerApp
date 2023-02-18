import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:reel_stories_admin/flutter_flow/flutter_flow_widgets.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class DashboardWidget extends StatefulWidget {
  @override
  _SecondAppState createState() => _SecondAppState();
}

class _SecondAppState extends State<DashboardWidget> {
  late String scannedDeviceId;
  late String? deviceId;

  // @override
  // void initState() {
  //   super.initState();
  //   scanQRCode();
  // }

  void scanQRCode() async {
    scannedDeviceId = await FlutterBarcodeScanner.scanBarcode(
      '#C62828', // scanning line color
      'Cancel', // cancel button text
      true, // whether to show the flash icon
      ScanMode.QR,
    );
    String? deviceId = await PlatformDeviceId.getDeviceId;
    FirebaseFirestore.instance
        .collection("devices")
        .doc(scannedDeviceId)
        .collection("connected_devices")
        .doc(deviceId)
        .set({
      "DeviceId": deviceId,
      "email":"Nikhil@gmail.com",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scanning QR code...'),
            // Generated code for this Button Widget...
            SizedBox(
              height: 50,
            ),
            FFButtonWidget(
              onPressed: () async {
                deviceId = await PlatformDeviceId.getDeviceId;
                scannedDeviceId = await FlutterBarcodeScanner.scanBarcode(
                  '#C62828', // scanning line color
                  'Cancel', // cancel button text
                  true, // whether to show the flash icon
                  ScanMode.QR,
                );
                await FirebaseFirestore.instance
                    .collection("devices")
                    .doc(scannedDeviceId)
                    .collection("connected_devices")
                    .doc(deviceId)
                    .set({
                  "DeviceId": deviceId,
                  "Email":"AbhishekJha@gmail.com"
                });
                setState(() {});
              },
              text: 'Button',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
