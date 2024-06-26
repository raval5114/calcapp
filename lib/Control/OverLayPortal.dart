import 'package:calcapp/Control/ListBuilderPractice.dart';
import 'package:flutter/material.dart';

class OverLayPortalPractice extends StatefulWidget {
  const OverLayPortalPractice({super.key});

  @override
  State<OverLayPortalPractice> createState() => _OverLayPortalPracticeState();
}

class _OverLayPortalPracticeState extends State<OverLayPortalPractice> {
  final OverlayPortalController overlayPortal = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overlay Portal Practice"),
        centerTitle: true,
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () => overlayPortal.toggle(),
          child: OverlayPortal(
            controller: overlayPortal,
            overlayChildBuilder: (BuildContext context) {
              return Positioned(left: 10, top: 350, child: displayTitle());
            },
            child: const Text("Click Me"),
          ),
        ),
      ),
    );
  }
}

class displayTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 3),
          duration: Duration(milliseconds: 240),
          builder: (BuildContext context, double val, Widget? child) {
            return Container(
                width: val * 100,
                height: 300,
                color: Colors.black45,
                child: ListView(
                  children: <Widget>[
                    child!,
                  ],
                ));
          },
          child: const historyListView()),
    );
  }
}
