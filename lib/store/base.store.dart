import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:mobx/mobx.dart';
part 'base.store.g.dart';

// ignore: library_private_types_in_public_api
class BaseStore = _BaseStoreBase with _$BaseStore;

abstract class _BaseStoreBase with Store {
  @observable
  double phValue = 0;

  @action
  void setPhValue(double value) {
    phValue = value;
  }

  @action
  Future<void> startDiscovery() async {
    print('teste');

    IO.Socket socket = IO.io("http://localhost:3000/", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print("Connection established");
    });
    socket.onDisconnect((_) => print("connection Disconnection"));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));

    socket.on('arduinoData', (data) {
      print(data);

      if (data.toString().contains('pH')) {
        String tempPh = data.toString().split('pH:')[1].split(' ')[1];

        setPhValue(double.parse(tempPh));
      }

      //setPhValue(data);
    });
  }
}
