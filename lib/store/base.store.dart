import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

import 'package:mobx/mobx.dart';
part 'base.store.g.dart';

// ignore: library_private_types_in_public_api
class BaseStore = _BaseStoreBase with _$BaseStore;

abstract class _BaseStoreBase with Store {
  @observable
  double phValue = 0;

  @observable
  SerialPort? port;

  @action
  void setPhValue(double value) {
    phValue = value;
  }

  @action
  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButton<String>(
                value: selectedOption,
                onChanged: (String newValue) {
                  setState(() {
                    selectedOption = newValue;
                  });
                },
                items: <String>['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para lidar com a seleção e iniciar
                  print('Opção selecionada: $selectedOption');
                  // Adicione a lógica de início aqui
                },
                child: const Text('Iniciar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @action
  Future<void> init(BuildContext context) async {
    if (port == null) {
      showModal(context);
      return;
    }

    /* open a model to search available ports */

    if (port!.openReadWrite()) {
      final reader = SerialPortReader(port!);

      reader.stream.listen((data) {
        try {
          String tempPh = String.fromCharCodes(data)
              .toString()
              .split('pH:')[1]
              .split(' ')[1];

          setPhValue(double.parse(tempPh));
          print('received: $data');
        } catch (e) {
          print(e);
          String.fromCharCodes(data);
        }
      });
    }
  }
}
