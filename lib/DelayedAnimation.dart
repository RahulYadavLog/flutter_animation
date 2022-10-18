import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class DelayedAnimation extends StatefulWidget {
  const DelayedAnimation({Key? key}) : super(key: key);

  @override
  State<DelayedAnimation> createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, mutchDelayedAniation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    // animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
    //     parent: animationController,
    //     curve: Curves.fastOutSlowIn));
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1, curve: Curves.fastOutSlowIn)));

    mutchDelayedAniation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1, curve: Curves.fastOutSlowIn)));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Column(
            children: [
              Transform(
                transform:
                    Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                child: Center(
                  child: Container(
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
              ),

              Transform(
                transform:
                Matrix4.translationValues(delayedAnimation.value * width, 0.0, 0.0),
                child: Center(
                  child: Container(
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
              ),
              Transform(
                transform:
                Matrix4.translationValues(mutchDelayedAniation.value * width, 0.0, 0.0),
                child: Center(
                  child: Container(
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
