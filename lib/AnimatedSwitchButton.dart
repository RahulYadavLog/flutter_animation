import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatedSwitchButton extends StatefulWidget {
  const AnimatedSwitchButton({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitchButton> createState() => _AnimatedSwitchButtonState();
}

class _AnimatedSwitchButtonState extends State<AnimatedSwitchButton>
    with SingleTickerProviderStateMixin {
  var toggoleValue = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text("Flip Animation")),
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: toggoleValue
                  ? Colors.greenAccent[100]
                  : Colors.redAccent[100]?.withOpacity(0.5)),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(
                  milliseconds: 1000,
                ),
                curve: Curves.easeIn,
                top: 3.0,
                left: toggoleValue ? 60.0 : 0.0,
                right: toggoleValue ? 0.0 : 60.0,
                child: InkWell(
                  onTap: toggoleButton,
                 child:AnimatedSwitcher(
                 duration: Duration(
                   milliseconds: 1000
                 ),
                   transitionBuilder: (Widget child,Animation<double> animation)
                   {
                     // return RotationTransition(turns: animation,child: child,);
                      return ScaleTransition(scale: animation,child: child,);
                   },
                   child: toggoleValue?Icon(Icons.check_circle,color: Colors.green,size: 35.0,
                   key: UniqueKey(),
                   ):Icon(Icons.remove_circle_outline,color: Colors.red,size: 35.0,
                     key: UniqueKey(),
                   )
                 ),
                ),
              )
            ],
          ),
        ));
  }

  toggoleButton() {
    setState(() {
      toggoleValue=!toggoleValue;
    });
  }
}
