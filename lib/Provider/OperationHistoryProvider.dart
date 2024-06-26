import 'package:calcapp/Model/OperationModel.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'OperationHistoryProvider.g.dart';

@riverpod
class HistoryProvider extends _$HistoryProvider {
  @override
  List<OperationModel> build() {
    return const [];
  }

  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Future<void> addElement(OperationModel) async {
    {
      state = [...state, OperationModel];
    }

    void clearList() {
      state = [];
    }
  }
}
