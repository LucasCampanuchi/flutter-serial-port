// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on _BaseStoreBase, Store {
  late final _$bluetoothAtom =
      Atom(name: '_BaseStoreBase.bluetooth', context: context);

  @override
  FlutterBluetoothSerial get bluetooth {
    _$bluetoothAtom.reportRead();
    return super.bluetooth;
  }

  @override
  set bluetooth(FlutterBluetoothSerial value) {
    _$bluetoothAtom.reportWrite(value, super.bluetooth, () {
      super.bluetooth = value;
    });
  }

  late final _$connectionAtom =
      Atom(name: '_BaseStoreBase.connection', context: context);

  @override
  BluetoothConnection? get connection {
    _$connectionAtom.reportRead();
    return super.connection;
  }

  @override
  set connection(BluetoothConnection? value) {
    _$connectionAtom.reportWrite(value, super.connection, () {
      super.connection = value;
    });
  }

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

  late final _$startDiscoveryAsyncAction =
      AsyncAction('_BaseStoreBase.startDiscovery', context: context);

  @override
  Future<void> startDiscovery() {
    return _$startDiscoveryAsyncAction.run(() => super.startDiscovery());
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
  String toString() {
    return '''
bluetooth: ${bluetooth},
connection: ${connection},
phValue: ${phValue}
    ''';
  }
}
