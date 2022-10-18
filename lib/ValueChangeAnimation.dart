import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ValueChangeAnimation extends StatefulWidget {
  const ValueChangeAnimation({Key? key}) : super(key: key);

  @override
  State<ValueChangeAnimation> createState() => _ValueChangeAnimationState();
}

class _ValueChangeAnimationState extends State<ValueChangeAnimation>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    // animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
    //     parent: animationController,
    //     curve: Curves.fastOutSlowIn));
    animation = IntTween(begin: 0, end:10).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text("Loading...."),
                Text(animation.value.toString(),style:TextStyle(fontSize:20,fontWeight: FontWeight.bold) ,)
              ],
            ),
          ),
        );
      },
    );
  }
}
