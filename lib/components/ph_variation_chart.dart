import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../store/base.store.dart';

class PhVariationChart extends StatelessWidget {
  final BaseStore store;

  const PhVariationChart({
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
              'Gráfico da alteração do pH',
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
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  isVisible: false,
                ),
                legend: const Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  textStyle: TextStyle(
                    color: Color.fromRGBO(
                      205,
                      206,
                      234,
                      1,
                    ),
                  ),
                ),
                annotations: [
                  CartesianChartAnnotation(
                    widget: Container(
                      child: const Text(
                        'PH',
                        style: TextStyle(
                          color: Color.fromRGBO(
                            205,
                            206,
                            234,
                            1,
                          ),
                        ),
                      ),
                    ),
                    coordinateUnit: CoordinateUnit.point,
                    region: AnnotationRegion.chart,
                    x: 0,
                    y: 0,
                  )
                ],
                series: <LineSeries<ChartData, int>>[
                  LineSeries<ChartData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      store.chartSeriesController = controller;
                    },
                    dashArray: <double>[10, 10],
                    animationDuration: 1500,
                    animationDelay: 100,
                    dataSource: store.chartData,
                    xValueMapper: (ChartData data, _) => data.id,
                    yValueMapper: (ChartData data, _) => data.ph,
                    color: const Color.fromRGBO(
                      205,
                      206,
                      234,
                      1,
                    ),
                    legendItemText: 'PH',
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

class ChartData {
  ChartData(this.id, this.ph);

  final int id;
  final double ph;
}
