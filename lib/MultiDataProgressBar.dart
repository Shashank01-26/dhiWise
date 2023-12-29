import 'package:flutter/material.dart';

class MultiDataLinearProgressBar extends StatelessWidget {
  final List<DataPoint> dataPoints;

  MultiDataLinearProgressBar({required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LinearProgressIndicator(
          minHeight: 20.0,
          backgroundColor: Colors.grey[300],
          value: 1.0, // Set to 1.0 to occupy the full width of the bar
        ),
        Positioned.fill(
          child: Row(
            children: _buildDataPoints(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDataPoints() {
    List<Widget> widgets = [];

    double totalValue = 0.0;

    dataPoints.forEach((dataPoint) {
      totalValue += dataPoint.value;
    });

    dataPoints.forEach((dataPoint) {
      double width = (dataPoint.value / totalValue);

      widgets.add(
        Expanded(
          flex: (width * 100).round(),
          child: Container(
            height: 20.0,
            child: LinearProgressIndicator(
              value: 1.0,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(dataPoint.color),
            ),
          ),
        ),
      );
    });

    return widgets;
  }
}

class DataPoint {
  final double value;
  final Color color;

  DataPoint({required this.value, required this.color});
}
