import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../store/base.store.dart';

class TempChart extends StatelessWidget {
  final BaseStore store;

  const TempChart({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        margin: const EdgeInsets.all(
          20,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
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
              'Temperatura',
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
            Expanded(
              child: SfLinearGauge(
                interval: 2,
                minimum: 20,
                maximum: 40,
                animateAxis: true,
                animateRange: true,
                animationDuration: 2500,
                axisLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                barPointers: [
                  LinearBarPointer(
                    value: store.tempValue,

                    //Apply radial gradient
                    shaderCallback: (bounds) => const RadialGradient(
                      tileMode: TileMode.mirror,
                      radius: 30,
                      colors: [
                        Colors.redAccent,
                        Colors.blueAccent,
                        Colors.greenAccent,
                      ],
                    ).createShader(bounds),
                  ),
                ],
                markerPointers: [
                  LinearWidgetPointer(
                    value: store.tempValue,
                    position: LinearElementPosition.cross,
                    child: const Icon(
                      Icons.circle,
                      color: Colors.redAccent,
                      size: 30,
                    ),
                  ),
                  LinearWidgetPointer(
                    value: store.tempValue,
                    position: LinearElementPosition.outside,
                    child: SizedBox(
                      width: 55,
                      height: 45,
                      child: Center(
                        child: Text(
                          '${store.tempValue}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
