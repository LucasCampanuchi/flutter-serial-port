import 'package:flutter/material.dart';

import 'package:tcc_daniel/components/ph_chart.dart';
import 'package:tcc_daniel/store/base.store.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/temp_chart.dart';

void main() {
  return runApp(const GaugeApp());
}

/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  const GaugeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  /// Creates the instance of MyHomePage
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BaseStore store = BaseStore();

  @override
  void initState() {
    store.startDiscovery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medidor de pH'),
        backgroundColor: const Color.fromRGBO(
          42,
          39,
          68,
          1,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(
        42,
        39,
        68,
        1,
      ),
      body: Observer(builder: (_) {
        return Column(
          children: [
            Expanded(
              child: PhChart(
                store: store,
              ),
            ),
            Expanded(
              child: TempChart(
                store: store,
              ),
            ),
          ],
        );
      }),
    );
  }
}
