import 'package:flutter/material.dart';
import 'package:project_yks/utils/constants.dart';

class CompletionIndicator extends StatelessWidget {
  final double completionRate; // 0.0 ile 1.0 arasında

  CompletionIndicator({required this.completionRate});

  @override
  Widget build(BuildContext context) {
    final percent = (completionRate * 100).toStringAsFixed(1);
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            "Görev İlerlemesi: %$percent",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          LinearProgressIndicator(
            value: completionRate,
            minHeight: 8,
            backgroundColor: Colors.grey.shade300,
            color: AppColors.altinSari,
          ),
        ],
      ),
    );
  }
}
