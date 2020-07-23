import 'package:flutter/material.dart';
import 'package:portfolio/strings/strings.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with TickerProviderStateMixin {
  AnimationController _slideDividerAnimationController;
  AnimationController _opacityAnimationForDividerController;
  Animation<Offset> _slideAnimationForDivider;
  Animation _opacityAnimationForDivider;
  @override
  void initState() {
    super.initState();
    _slideDividerAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _opacityAnimationForDividerController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _opacityAnimationForDivider =
      Tween<double>(begin: 0.0, end: 1.0).animate(_opacityAnimationForDividerController);
    _slideAnimationForDivider = Tween<Offset>(begin: Offset(0.0, -0.5), end: Offset(0.0, 0.07))
      .animate(_slideDividerAnimationController);

    Future.delayed(Duration(seconds: 1), () {
      _slideDividerAnimationController.forward();
      _opacityAnimationForDividerController.forward();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "A little bit about me",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
          ),
          SlideTransition(
            position: _slideAnimationForDivider,
            child: FadeTransition(
              opacity: _opacityAnimationForDivider,
              child: Container(height: 3,color: Colors.black45,width: MediaQuery.of(context).size.width/4,),
            ),
          ),
          SizedBox(height: 50,),
          Text(Strings.aboutMe),
        ],
      ),
    );
  }
}
