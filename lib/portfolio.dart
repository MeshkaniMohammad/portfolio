import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/specs.dart';


class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              child: Container(
                color: Colors.black,
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
              flex: 1,
            ),
          ],
        ),
        Align(
          child: MyCard(),
        ),
      ],
    );
  }
}

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with TickerProviderStateMixin {
  AnimationController animationController;
//  AnimationController slideAnimationForBottomController;
//  AnimationController _opacityAnimationForBottomController;
//  AnimationController _opacityAnimationForImageController;
//  AnimationController _opacityAnimationForSpecsController;
//  AnimationController _opacityAnimationForTopController;
//  AnimationController _opacityAnimationForAboutController;
//  AnimationController _slideAnimationForTopController;
//  AnimationController _slideAnimationForAboutController;
//  AnimationController _slideImageAnimationController;
//  AnimationController _slideSpecsAnimationController;
  Animation<Offset> _slideAnimationForBottom;
  Animation<Offset> _slideAnimationForImage;
  Animation<Offset> _slideAnimationForSpecs;
  Animation<Offset> _slideAnimationForTop;
  Animation<Offset> _slideAnimationForAbout;
  Animation _opacityAnimationForImage;
  Animation _opacityAnimationForLogo;
  Animation _opacityAnimationForSpecs;
  Animation _opacityAnimationForBottom;
  Animation _opacityAnimationForTop;
  Animation _opacityAnimationForAbout;
  bool _logoOpacity = true;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 11));

//    slideAnimationForBottomController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _slideImageAnimationController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _slideSpecsAnimationController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _opacityAnimationForBottomController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _slideAnimationForTopController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _slideAnimationForAboutController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _opacityAnimationForTopController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _opacityAnimationForAboutController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _opacityAnimationForImageController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//    _opacityAnimationForSpecsController = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
    _opacityAnimationForLogo = Tween<double>(begin: 0.95, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.24),
      ),
    );
    _opacityAnimationForBottom = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.1, 0.2),
      ),
    );
    _slideAnimationForBottom = Tween<Offset>(begin: Offset(0.0, 0.35), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.1, 0.2),
      ),
    );

    _opacityAnimationForImage = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.3),
      ),
    );
    _opacityAnimationForSpecs = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.3),
      ),
    );

    _opacityAnimationForTop = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.1, 0.2),
      ),
    );
//    _opacityAnimationForAbout =
//        Tween<double>(begin: 0.0, end: 1.0).animate(_opacityAnimationForAboutController);
    _slideAnimationForTop =
        Tween<Offset>(begin: Offset(0.0, -0.5), end: Offset(0.0, 0.07)).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.1, 0.2),
    ));
//    _slideAnimationForAbout = Tween<Offset>(begin: Offset(0.0, -0.5), end: Offset(0.0, 0.07))
//        .animate(_slideAnimationForAboutController);
    _slideAnimationForImage =
        Tween<Offset>(begin: Offset(10.0, 0.0), end: Offset(0.6, 0.0)).animate(CurvedAnimation(
            parent: CurvedAnimation(
              parent: animationController,
              curve: Interval(0.25, 0.3),
            ),
            curve: Curves.easeInOut));
    _slideAnimationForSpecs =
        Tween<Offset>(begin: Offset(-10.0, 0.05), end: Offset(0.0, 0.05)).animate(CurvedAnimation(
            parent: CurvedAnimation(
              parent: animationController,
              curve: Interval(0.2, 0.3),
            ),
            curve: Curves.easeInOut));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: MediaQuery.of(context).size.height - 200,
        child: Stack(
          children: [
            Align(
              child: FadeTransition(
                opacity: _opacityAnimationForLogo,
                child: FlareActor(
                  'assets/finish_logo.flr',
                  animation: 'finish',
                ),
              ),
            ),
            Align(
              child: SlideTransition(
                position: _slideAnimationForTop,
                child: FadeTransition(
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/logo.png',
                        ),
                      ),
                    ),
                  ),
                  opacity: _opacityAnimationForTop,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Align(
              child: SlideTransition(
                position: _slideAnimationForTop,
                child: FadeTransition(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "CONTACT",
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                  opacity: _opacityAnimationForTop,
                ),
              ),
              alignment: Alignment.topRight,
            ),
            Align(
              child: SlideTransition(
                position: _slideAnimationForBottom,
                child: FadeTransition(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
//                        _slideImageAnimationController.reverse();
//                        _opacityAnimationForImageController.reverse();
//                        _slideSpecsAnimationController.reverse();
//                        _opacityAnimationForSpecsController.reverse();
//                        _opacityAnimationForBottomController.reverse();
//                        slideAnimationForBottomController.reverse();
//                        _slideAnimationForAboutController.forward();
//                        _opacityAnimationForBottomController.reverse();
//                        slideAnimationForBottomController.reverse();
                        //animationController.reverse(from: );
                      },
                      icon: Icon(
                        CupertinoIcons.down_arrow,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  opacity: _opacityAnimationForBottom,
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
            Align(
              child: SlideTransition(
                position: _slideAnimationForBottom,
                child: FadeTransition(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.github),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.instagram),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  opacity: _opacityAnimationForBottom,
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
            Align(
              child: SlideTransition(
                position: _slideAnimationForImage,
                child: FadeTransition(
                  opacity: _opacityAnimationForImage,
                  child: Image.asset('assets/myAvatar.png',width: 150,height: 200,),
                ),
              ),
            ),
            Align(
              child: SlideTransition(
                position: _slideAnimationForSpecs,
                child: FadeTransition(
                  opacity: _opacityAnimationForSpecs,
                  child: Specs(),
                ),
              ),
            ),
//            Align(
//              alignment: Alignment.topCenter,
//              child: SlideTransition(
//                position: _slideAnimationForAbout,
//                child: FadeTransition(
//                  opacity: _opacityAnimationForAbout,
//                  child: AboutMe(),
//                ),
//              ),
//            )
          ],
        ),
      ),
    );
  }
}
