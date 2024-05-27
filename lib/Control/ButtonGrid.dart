import 'package:calcapp/Provider/OperationProvider.dart';

import 'package:calcapp/Control/ActionButtons.dart';
import 'package:calcapp/Provider/resultProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonGrid extends ConsumerStatefulWidget {
  const ButtonGrid({super.key});

  @override
  ConsumerState<ButtonGrid> createState() => _ButtonGridState();
}

class _ButtonGridState extends ConsumerState<ButtonGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      height: 479,
      color: Colors.black87,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.history,
                      size: 30,
                    )),
                Expanded(child: SizedBox())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton("AC", Colors.blueAccent, Colors.transparent, () {
                  ref.read(operationProvider.notifier).clearList();
                  ref.read(resultProvider.notifier).clearString();
                }),
                ActionButton("<-", Colors.blueAccent, Colors.transparent, () {
                  ref.read(operationProvider.notifier).removeElement();
                }),
                ActionButton(
                    "+/-", Colors.blueAccent, Colors.transparent, () {}),
                ActionButton("/", Colors.blueAccent, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("/");
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton("7", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("7");
                }),
                ActionButton("8", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("8");
                }),
                ActionButton("9", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("9");
                }),
                ActionButton("*", Colors.blueAccent, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("*");
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton("4", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("4");
                }),
                ActionButton("5", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("5");
                }),
                ActionButton("6", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("6");
                }),
                ActionButton("-", Colors.blueAccent, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("-");
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton("1", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("1");
                }),
                ActionButton("2", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("2");
                }),
                ActionButton("3", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("3");
                }),
                ActionButton("+", Colors.blueAccent, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("+");
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton("%", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("%");
                }),
                ActionButton("0", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement("0");
                }),
                ActionButton(".", Colors.white, Colors.transparent, () {
                  ref.read(operationProvider.notifier).addElement(".");
                }),
                ActionButton("=", Colors.white, Colors.blueAccent[400], () {
                  String s = ref.watch(operationProvider).join();
                  ref.read(resultProvider.notifier).eval(s);
                  //print(s);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
