import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ParentingAnimation extends StatefulWidget {
  const ParentingAnimation({Key? key}) : super(key: key);

  @override
  State<ParentingAnimation> createState() => _ParentingAnimationState();
}

class _ParentingAnimationState extends State<ParentingAnimation>
    with SingleTickerProviderStateMixin {
  late Animation animation, childAnimation;
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
    animation = Tween(begin: -0.25, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    childAnimation = Tween(begin: 20.0, end: 125.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
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
            child: Column(
              children: [
                Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Center(
                      child: Container(
                        child: AnimatedBuilder(
                          animation: childAnimation,
                          builder: (BuildContext context, Widget? child) {
                            return Center(
                              child: Container(
                                height: childAnimation.value*2,
                                width: childAnimation.value*2,
                                decoration: BoxDecoration(
                                  color: Colors.yellow
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
