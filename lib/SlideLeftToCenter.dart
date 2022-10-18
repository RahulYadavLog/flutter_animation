import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late Animation animation;
  late AnimationController animationController;

  @override void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(duration: Duration(seconds: 2),vsync: this);
    // animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
    //     parent: animationController,
    //     curve: Curves.fastOutSlowIn));
    animation=Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn));
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Transform(
            transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
            child: Center(
              child: Container(
                child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              ),
            ),
          ),
        );
      },

    );
  }
}
