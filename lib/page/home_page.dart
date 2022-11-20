import 'package:iot_do_conic/main.dart';
import 'package:iot_do_conic/page/fingerprint_page.dart';
import 'package:flutter/material.dart';
import 'package:iot_do_conic/Widget/Menuzinho.dart';
import 'package:flutter_blue/flutter_blue.dart';

class HomePage extends StatelessWidget {

      @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                  'Lâmpada da sala de jantar',
                  style: TextStyle(fontSize: 40),
                ),
                Icon(Icons.toggle_off, size: 100, color: Colors.black,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                  'Lâmpada da sala',
                  style: TextStyle(fontSize: 40),
                ),
                Icon(Icons.toggle_off, size: 100, color: Colors.black,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                  'Liberar o roomba',
                  style: TextStyle(fontSize: 40),
                ),
                Icon(Icons.toggle_on, size: 100, color: Colors.red,),
                  ],
                ),
              ],
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: BluetoothScanning,
        tooltip: 'Adicionar dispositivo',
        child: Icon(Icons.add),),
    );
  }
}

FlutterBlue flutterBlue = FlutterBlue.instance;

void BluetoothScanning(){
  flutterBlue.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
var subscription = flutterBlue.scanResults.listen((results) {
    // do something with scan results
    for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
    }
});

// Stop scanning
flutterBlue.stopScan();
}