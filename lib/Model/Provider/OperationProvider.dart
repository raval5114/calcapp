// ignore: file_names
import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:calcapp/Model/string_gen.dart';

var parser = MyParser();

class Operation extends Notifier<List<String>> {
  String? result;
  @override
  List<String> build() {
    return (const []);
  }

  void addElement(String? element) {
    state = [...state, element!];
  }

  void removeElement() {
    state = state.sublist(0, state.length - 1);
  }

  void eval() {
    var str = state.join();
    result = parser.parse(str).toString();
  }

  void clearList() {
    state = [];
  }
}

final opProvider = NotifierProvider<Operation, List<String>>(() {
  return Operation();
});
