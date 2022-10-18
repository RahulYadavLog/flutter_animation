import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({Key? key}) : super(key: key);

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> flip_animation;
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
    flip_animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.0,0.5,curve: Curves.linear)));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title:Text("Flip Animation")),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return Center(
         child: InkWell(
           onTap: (){
             animationController.repeat();
           },
           child: Container(
             height: 200.0,
             width:200.0,
             child: Transform(
               transform: Matrix4.identity()
               ..setEntry(3, 2, 0.005)
                 ..rotateY((2 * pi)!! * flip_animation.value),
             alignment: Alignment.center,
               child: Container(
                 height: 100.0,
                 width: 100.0,
                 color: Colors.green.withOpacity(0.2),
                 child: RotationTransition(
                   turns: flip_animation,
                   child: Center(
                        child: Text("This Flips",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        ),),
                   ),
                 ),
               ),
             ),
           ),
         ),
          );
        },
      )
    );
  }
}
