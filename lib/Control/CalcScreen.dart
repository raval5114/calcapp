import 'package:calcapp/Model/Provider/OperationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalcScreen extends ConsumerStatefulWidget {
  final operation, history;
  const CalcScreen(this.operation, this.history);

  @override
  ConsumerState<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends ConsumerState<CalcScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          width: 420,
          height: 80,
          color: Colors.black87,
          alignment: Alignment.bottomRight,
          child: Text(
            widget.operation,
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 33,
                fontWeight: FontWeight.w300),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          width: 420,
          height: 80,
          color: Colors.black87,
          alignment: Alignment.bottomRight,
          child: Text(
            widget.history,
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 33,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
