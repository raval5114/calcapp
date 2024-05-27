import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:calcapp/Model/string_gen.dart';

part 'OperationProvider.g.dart';

@riverpod
class Operation extends _$Operation {
  @override
  List<String> build() {
    return (const []);
  }

  void addElement(String? element) {
    state = [...state, element!];
  }

  void removeElement() {
    if (state.length > 0) {
      state = state.sublist(0, state.length - 1);
    }
  }

  void clearList() {
    state = [];
  }
}
