// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on _BaseStoreBase, Store {
  late final _$phValueAtom =
      Atom(name: '_BaseStoreBase.phValue', context: context);

  @override
  double get phValue {
    _$phValueAtom.reportRead();
    return super.phValue;
  }

  @override
  set phValue(double value) {
    _$phValueAtom.reportWrite(value, super.phValue, () {
      super.phValue = value;
    });
  }

  late final _$indexAtom = Atom(name: '_BaseStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$chartSeriesControllerAtom =
      Atom(name: '_BaseStoreBase.chartSeriesController', context: context);

  @override
  ChartSeriesController? get chartSeriesController {
    _$chartSeriesControllerAtom.reportRead();
    return super.chartSeriesController;
  }

  @override
  set chartSeriesController(ChartSeriesController? value) {
    _$chartSeriesControllerAtom.reportWrite(value, super.chartSeriesController,
        () {
      super.chartSeriesController = value;
    });
  }

  late final _$chartDataAtom =
      Atom(name: '_BaseStoreBase.chartData', context: context);

  @override
  List<ChartData> get chartData {
    _$chartDataAtom.reportRead();
    return super.chartData;
  }

  @override
  set chartData(List<ChartData> value) {
    _$chartDataAtom.reportWrite(value, super.chartData, () {
      super.chartData = value;
    });
  }

  late final _$portAtom = Atom(name: '_BaseStoreBase.port', context: context);

  @override
  SerialPort? get port {
    _$portAtom.reportRead();
    return super.port;
  }

  @override
  set port(SerialPort? value) {
    _$portAtom.reportWrite(value, super.port, () {
      super.port = value;
    });
  }

  late final _$selectedOptionAtom =
      Atom(name: '_BaseStoreBase.selectedOption', context: context);

  @override
  String? get selectedOption {
    _$selectedOptionAtom.reportRead();
    return super.selectedOption;
  }

  @override
  set selectedOption(String? value) {
    _$selectedOptionAtom.reportWrite(value, super.selectedOption, () {
      super.selectedOption = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_BaseStoreBase.init', context: context);

  @override
  Future<void> init(BuildContext context) {
    return _$initAsyncAction.run(() => super.init(context));
  }

  late final _$_BaseStoreBaseActionController =
      ActionController(name: '_BaseStoreBase', context: context);

  @override
  void setPhValue(double value) {
    final _$actionInfo = _$_BaseStoreBaseActionController.startAction(
        name: '_BaseStoreBase.setPhValue');
    try {
      return super.setPhValue(value);
    } finally {
      _$_BaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addChartData(double ph) {
    final _$actionInfo = _$_BaseStoreBaseActionController.startAction(
        name: '_BaseStoreBase.addChartData');
    try {
      return super.addChartData(ph);
    } finally {
      _$_BaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showModal(BuildContext context) {
    final _$actionInfo = _$_BaseStoreBaseActionController.startAction(
        name: '_BaseStoreBase.showModal');
    try {
      return super.showModal(context);
    } finally {
      _$_BaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phValue: ${phValue},
index: ${index},
chartSeriesController: ${chartSeriesController},
chartData: ${chartData},
port: ${port},
selectedOption: ${selectedOption}
    ''';
  }
}
