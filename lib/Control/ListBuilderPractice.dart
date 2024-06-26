import 'package:calcapp/Provider/OperationHistoryProvider.dart';
import 'package:calcapp/Provider/OperationProvider.dart';
import 'package:calcapp/Provider/resultProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HistoryShowingButton extends StatefulWidget {
  final Icon hisIcon;
  const HistoryShowingButton(this.hisIcon);
  @override
  State<HistoryShowingButton> createState() => _HistoryShowingButtonState();
}

class _HistoryShowingButtonState extends State<HistoryShowingButton> {
  final OverlayPortalController opController = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        onPressed: () => opController.toggle(),
        child: OverlayPortal(
          controller: opController,
          overlayChildBuilder: (BuildContext context) {
            return Positioned(
                left: 10, top: 350, child: historyPanelAnimated());
          },
          child: widget.hisIcon,
        ));
  }
}

class historyPanelAnimated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 220),
      tween: Tween<double>(begin: 0, end: 3),
      builder: (context, double value, child) {
        return Container(
            width: value * 100,
            height: 300,
            color: Colors.black45,
            child: child);
      },
      child: const historyListView(),
    );
  }
}

class historyListView extends ConsumerStatefulWidget {
  const historyListView({super.key});

  @override
  ConsumerState<historyListView> createState() => _historyListViewState();
}

class _historyListViewState extends ConsumerState<historyListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(10)),
      width: 280,
      height: 800,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: 300,
              height: 200,
              color: Colors.transparent,
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.transparent,
                  //width: ,
                  child: const ListExpample()),
            ),
          ),
          Expanded(
              child: TextButton(
            onPressed: () {
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
              ref.watch(historyProviderProvider.notifier).state.clear();
            },
            child: const Text(
              "clear history",
              style: TextStyle(color: Colors.blueAccent, fontSize: 15),
            ),
          ))
        ],
      ),
    );
  }
}

class ListExpample extends ConsumerWidget {
  const ListExpample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final operation = ref.watch(historyProviderProvider);
    return ListView.builder(
      itemCount: operation.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.transparent,
            //width: ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  operation[index].operationList.toString(),
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  operation[index].result.toString(),
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
