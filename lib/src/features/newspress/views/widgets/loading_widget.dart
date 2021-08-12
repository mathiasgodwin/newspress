import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {

  @override
  _LoadingWidget createState() => _LoadingWidget();
}

class _LoadingWidget extends State<LoadingWidget>
    with TickerProviderStateMixin {
  AnimationController? controller1;
  Animation<double>? animation1;

  AnimationController? controller2;
  Animation<double>? animation2;


  @override
  void initState() {
    super.initState();

    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation1 = Tween<double>(begin: .0, end: 2)
        .animate(CurvedAnimation(parent: controller1!, curve: Curves.easeInOut))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller1!.reverse();
              controller2!.forward();
            } else if (status == AnimationStatus.dismissed) {
              controller1!.forward();
            }
          });

    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation2 = Tween<double>(begin: .0, end: 2)
        .animate(CurvedAnimation(parent: controller2!, curve: Curves.easeInOut))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller2!.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller2!.forward();
            }
          });
    controller1!.forward();
  }

  @override
  void dispose() {
    controller1!.dispose();
    controller2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          // height: _w / 18,
          width: _w / 24,
          child: CustomPaint(
            painter: LoadPainter(animation1!.value, animation2!.value),
          ),
        ),
      ),
    );
  }
}

class LoadPainter extends CustomPainter {
  late final double? Radius_1;
  late final double? Radius_2;

  LoadPainter(this.Radius_1, this.Radius_2);

  @override
  void paint(Canvas canvas, Size size) {
    Paint Circle_1 = Paint()..color = Colors.greenAccent.withOpacity(.5);

    Paint Circle_2 = Paint()..color = Colors.orangeAccent.withOpacity(.5);

    canvas.drawCircle(Offset(size.width * .1, size.height * .6),
        size.width * Radius_1!, Circle_1);
    canvas.drawCircle(Offset(size.width * .1, size.height * .6),
        size.width * Radius_2!, Circle_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
