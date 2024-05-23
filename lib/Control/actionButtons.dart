import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final actionName;
  final color;
  final bgColor;
  Function callBack;
  ActionButton(this.actionName, this.color, this.bgColor, this.callBack);

  @override
  Widget build(BuildContext context) {
    void funcCallBack() {
      callBack();
    }

    return Container(
      margin: EdgeInsets.only(top: 5, left: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(180),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
          ),
          onPressed: () {
            // ref.watch(opProvider.notifier).addElement(actionName.toString());
            funcCallBack();
          },
          child: Text(
            actionName,
            style: TextStyle(color: color, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
