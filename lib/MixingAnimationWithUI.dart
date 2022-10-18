import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MixingAnimationWithUI extends StatefulWidget {
  const MixingAnimationWithUI({Key? key}) : super(key: key);

  @override
  State<MixingAnimationWithUI> createState() => _MixingAnimationWithUIState();
}

class _MixingAnimationWithUIState extends State<MixingAnimationWithUI>
    with SingleTickerProviderStateMixin {
  late Animation animation;
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
    animation = Tween(begin: 0.0, end: -0.15).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
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
                      padding: EdgeInsets.all(10),
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue
                          ),
                            onPressed: (){}, child: Text("Buy",style: TextStyle(color: Colors.white),)),
                        ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                            primary: Colors.blue
                        ), child: Text("Details",style: TextStyle(color: Colors.white),))
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(child: Icon(Icons.access_alarm_outlined)),
                        transform: Matrix4.translationValues(0.0, animation.value*width, 0.0),
                      ),
                      onTap: (){
                        animationController.forward();
                      },
                      onDoubleTap: (){
                        animationController.reverse();
                      },
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
