import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tcc_daniel/tools/log_write.dart';

import '../components/ph_variation_chart.dart';
part 'base.store.g.dart';

// ignore: library_private_types_in_public_api
class BaseStore = _BaseStoreBase with _$BaseStore;

abstract class _BaseStoreBase with Store {
  @observable
  double phValue = 0;

  @action
  void setPhValue(double value) {
    phValue = value;

    addChartData(value);
  }

  @observable
  int index = 0;

  @observable
  ChartSeriesController? chartSeriesController;

  @observable
  List<ChartData> chartData = [];

  @action
  void addChartData(double ph) {
    double formattedPh = double.parse(ph.toStringAsFixed(1));

    if (chartData.isNotEmpty) {
      if (chartData.last.ph == formattedPh) {
        return;
      }
    }

    chartData.add(
      ChartData(
        index,
        formattedPh,
      ),
    );

    chartData = chartData;

    chartSeriesController!.updateDataSource(
      addedDataIndexes: <int>[index],
      removedDataIndexes: <int>[],
    );

    index++;
  }

  @observable
  SerialPort? port;

  @observable
  String? selectedOption;

  @action
  void showModal(BuildContext context) {
    try {
      writeLog('Mostrando modal para selecionar a porta serial');
      writeLog('Portas disponíveis: ${SerialPort.availablePorts}');

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
                    onPressed: () async {
                      Navigator.pop(context);
                      await writeLog('Porta selecionada: $selectedOption').then(
                        (value) => {init(context)},
                      );

                      // Lógica para lidar com a seleção e iniciar
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
    } catch (e) {
      writeLog('Erro ao mostrar modal: $e');
    }
  }

  @action
  Future<void> init(BuildContext context) async {
    await writeLog('Iniciando a conexão com a porta serial');

    try {
      if (selectedOption == null) {
        await writeLog('Nenhuma porta selecionada');

        showModal(context);
        return;
      }

      port = SerialPort(selectedOption!);
      await writeLog('SerialPort: $port');
      await writeLog(
        'SerialPort está aberta para leitura e escrita: ${port!.openReadWrite()}',
      );

      final reader = SerialPortReader(port!);

      await writeLog('SerialPortReader: $reader');

      reader.stream.listen((data) {
        String realData = String.fromCharCodes(data);
        writeLog('Dados recebidos: $realData - ${DateTime.now()}');

        try {
          if (realData.contains('pH:')) {
            String tempPh = realData.split('pH:')[1].split(' ')[1];

            setPhValue(double.parse(tempPh));
          }
        } catch (e) {
          writeLog('Erro ao converter pH: $e');
        }
      });
    } catch (e) {
      await writeLog('Erro ao iniciar a conexão com a porta serial (l138): $e');
    }
  }
}
