import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'package:mobx/mobx.dart';
part 'base.store.g.dart';

// ignore: library_private_types_in_public_api
class BaseStore = _BaseStoreBase with _$BaseStore;

abstract class _BaseStoreBase with Store {
  @observable
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  @observable
  BluetoothConnection? connection;

  @observable
  double phValue = 0;

  @action
  void setPhValue(double value) {
    phValue = value;
  }

  @action
  Future<void> startDiscovery() async {
    /* List<BluetoothDevice> devices = [];

    bluetooth.startDiscovery().listen((r) {
      print("${r.device.name} - ${r.device.address} - ${r.device.type}");

      devices.add(r.device);
    });

    // Connect to the Bluetooth device
    for (var device in devices) {
      if (device.name == "NomeDoSeuDispositivoBluetooth") {
        bluetooth.cancelDiscovery();
        BluetoothConnection.toAddress('6C:F7:84:B1:4B:74').then((con) {
          print('Conectado a ${device.name}');

          connection = con;

          // Escutar dados recebidos
          connection?.input?.listen((Uint8List data) {
            String message = String.fromCharCodes(data);
            print('Recebido: $message');
            // Faça o que quiser com os dados recebidos aqui
          });
        });
      }
    } */

    BluetoothConnection.toAddress('6C:F7:84:B1:4B:74').then((con) {
      print('Conectado ');

      connection = con;

      // Escutar dados recebidos
      connection?.input?.listen((Uint8List data) {
        String message = String.fromCharCodes(data);
        print('Recebido: $message');
        // Faça o que quiser com os dados recebidos aqui
      });
    });
  }
}
