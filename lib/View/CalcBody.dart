import 'package:calcapp/Control/ButtonGrid.dart';
import 'package:calcapp/Control/CalcScreen.dart';
import 'package:calcapp/Control/actionButtons.dart';
import 'package:calcapp/Model/Provider/OperationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalcBody extends ConsumerStatefulWidget {
  @override
  ConsumerState<CalcBody> createState() => _CalcBodyState();
}

class _CalcBodyState extends ConsumerState<CalcBody> {
  @override
  Widget build(BuildContext context) {
    final opString = ref.watch(opProvider);
    //   final opResult = ref.watch(opProvider);
    return Column(
      children: [
        CalcScreen(opString.join(), ref.read(opProvider.notifier).result),
        ButtonGrid(),
      ],
    );
  }
}
