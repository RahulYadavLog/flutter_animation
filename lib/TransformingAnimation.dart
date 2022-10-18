import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class TransformationAnimation extends StatefulWidget {
  const TransformationAnimation({Key? key}) : super(key: key);

  @override
  State<TransformationAnimation> createState() => _TransformationAnimationState();
}

class _TransformationAnimationState extends State<TransformationAnimation>
    with SingleTickerProviderStateMixin {
  late Animation animation, transformationAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    // animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
    //     parent: animationController,
    //     curve: Curves.fastOutSlowIn));
    animation = Tween(begin: 20.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    transformationAnimation = BorderRadiusTween(begin:BorderRadius.circular(125.0), end: BorderRadius.circular(0.0)).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: animation.value,
                    height: animation.value,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: transformationAnimation.value
                    ),
                    child: Center(child: Icon(
                        Icons.access_alarm_outlined,size: animation.value,)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
