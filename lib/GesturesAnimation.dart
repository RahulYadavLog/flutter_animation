import 'package:flutter/material.dart';
class GestureAnimation extends StatefulWidget {
  const GestureAnimation({Key? key}) : super(key: key);

  @override
  State<GestureAnimation> createState() => _GestureAnimationState();
}

class _GestureAnimationState extends State<GestureAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture"),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            print("Clicked");
          },
          child: Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width:100,
            decoration: BoxDecoration(
              // color: Colors.cyanAccent,
            borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text("Click me")),
          ),
        ),
      ),
    );
  }
}
