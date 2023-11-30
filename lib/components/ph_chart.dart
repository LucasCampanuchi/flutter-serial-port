import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../store/base.store.dart';

class PhChart extends StatelessWidget {
  final BaseStore store;

  const PhChart({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        20,
      ),
      padding: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: const Color.fromRGBO(
          58,
          58,
          94,
          1,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'PH',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(
                205,
                206,
                234,
                1,
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
            child: SfRadialGauge(
              enableLoadingAnimation: true,
              animationDuration: 2500,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 14,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: const AxisLineStyle(
                    cornerStyle: CornerStyle.bothCurve,
                    color: Color.fromRGBO(230, 230, 230, 1),
                    thickness: 25,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: store.phValue,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 25,
                      sizeUnit: GaugeSizeUnit.logicalPixel,
                      gradient: const SweepGradient(
                        colors: <Color>[
                          Color.fromRGBO(86, 253, 223, 1),
                          Color.fromRGBO(61, 18, 246, 1),
                        ],
                        stops: <double>[0.25, 0.75],
                      ),
                    ),
                    MarkerPointer(
                      value: store.phValue,
                      enableDragging: true,
                      markerHeight: 25,
                      markerWidth: 25,
                      markerType: MarkerType.circle,
                      color: Colors.white,
                      borderWidth: 7,
                      borderColor: const Color.fromRGBO(61, 178, 246, 1),
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      angle: 90,
                      axisValue: 5,
                      positionFactor: 0.1,
                      widget: Text(
                        store.phValue.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(
                            205,
                            206,
                            234,
                            1,
                          ),
                        ),
                      ),
                    ),
                    /* const GaugeAnnotation(
                              angle: 90,
                              axisValue: 5,
                              positionFactor: 0.4,
                              widget: Text(
                                'Valor do PH',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(
                                    205,
                                    206,
                                    234,
                                    1,
                                  ),
                                ),
                              ),
                            ), */
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
