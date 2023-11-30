import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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

  @observable
  double tempValue = 0;

  @action
  void setTempValue(double value) {
    tempValue = value;
  }

  @observable
  SerialPort? port;

  @observable
  String? selectedOption;

  @action
  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Observer(
          builder: (_) => Container(
            constraints: const BoxConstraints(
              maxHeight: 200,
              minWidth: 200,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedOption,
                  onChanged: (String? newValue) {
                    selectedOption = newValue;
                  },
                  items: <String>[
                    ...SerialPort.availablePorts,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    print(selectedOption);
                    // Lógica para lidar com a seleção e iniciar
                    Navigator.pop(context);
                    init(context);
                    // Adicione a lógica de início aqui
                  },
                  child: const Text('Iniciar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @action
  Future<void> init(BuildContext context) async {
    if (selectedOption == null) {
      showModal(context);
      return;
    }

    port = SerialPort(selectedOption!);

    if (port!.openReadWrite()) {
      final reader = SerialPortReader(port!);

      reader.stream.listen((data) {
        String realData = String.fromCharCodes(data);

        try {
          if (realData.contains('pH:')) {
            String tempPh = realData.split('pH:')[1].split(' ')[1];

            setPhValue(double.parse(tempPh));
          }
        } catch (e) {
          print(e);
        }

        try {
          if (realData.contains('temp:')) {
            String tempTemp = realData.split('temp:')[1].split(' ')[1];

            setTempValue(double.parse(tempTemp));
          }
        } catch (e) {
          print(e);
          String.fromCharCodes(data);
        }
      });
    }
  }
}
