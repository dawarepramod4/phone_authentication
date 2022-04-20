import 'package:flutter/cupertino.dart';

class FrontCliper extends CustomClipper<Path>{
@override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 1074;
    final double _yScaling = size.height / 303;
    path.lineTo(0 * _xScaling,13.122 * _yScaling);
    path.cubicTo(0 * _xScaling,13.122 * _yScaling,29.535 * _xScaling,39.962 * _yScaling,29.535 * _xScaling,39.962 * _yScaling,);
    path.cubicTo(59.07 * _xScaling,66.803 * _yScaling,118.14 * _xScaling,120.48400000000001 * _yScaling,179.895 * _xScaling,136.589 * _yScaling,);
    path.cubicTo(238.965 * _xScaling,152.69299999999998 * _yScaling,298.035 * _xScaling,131.22 * _yScaling,357.105 * _xScaling,104.38 * _yScaling,);
    path.cubicTo(418.86 * _xScaling,77.54 * _yScaling,477.93 * _xScaling,45.33 * _yScaling,537 * _xScaling,23.858 * _yScaling,);
    path.cubicTo(596.07 * _xScaling,2.386 * _yScaling,655.14 * _xScaling,-8.35 * _yScaling,716.895 * _xScaling,7.754 * _yScaling,);
    path.cubicTo(775.965 * _xScaling,23.857999999999997 * _yScaling,835.035 * _xScaling,66.804 * _yScaling,894.105 * _xScaling,77.539 * _yScaling,);
    path.cubicTo(955.86 * _xScaling,88.276 * _yScaling,1014.9300000000001 * _xScaling,66.803 * _yScaling,1044.46 * _xScaling,56.067 * _yScaling,);
    path.cubicTo(1044.46 * _xScaling,56.067 * _yScaling,1074 * _xScaling,45.33 * _yScaling,1074 * _xScaling,45.33 * _yScaling,);
    path.cubicTo(1074 * _xScaling,45.33 * _yScaling,1074 * _xScaling,303 * _yScaling,1074 * _xScaling,303 * _yScaling,);
    path.cubicTo(1074 * _xScaling,303 * _yScaling,0 * _xScaling,303 * _yScaling,0 * _xScaling,303 * _yScaling,);
    path.cubicTo(0 * _xScaling,303 * _yScaling,0 * _xScaling,13.122 * _yScaling,0 * _xScaling,13.122 * _yScaling,);
    path.cubicTo(0 * _xScaling,13.122 * _yScaling,0 * _xScaling,13.122 * _yScaling,0 * _xScaling,13.122 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}
class BackCliper extends CustomClipper<Path>{
 @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 1079;
    final double _yScaling = size.height / 277;
    path.lineTo(0 * _xScaling,50.358 * _yScaling);
    path.cubicTo(0 * _xScaling,50.358 * _yScaling,44.958 * _xScaling,34.169 * _yScaling,44.958 * _xScaling,34.169 * _yScaling,);
    path.cubicTo(89.917 * _xScaling,17.98 * _yScaling,179.833 * _xScaling,-14.397 * _yScaling,269.75 * _xScaling,7.188 * _yScaling,);
    path.cubicTo(359.666 * _xScaling,28.773 * _yScaling,449.584 * _xScaling,104.32 * _yScaling,539.5 * _xScaling,147.49 * _yScaling,);
    path.cubicTo(629.4159999999999 * _xScaling,190.66000000000003 * _yScaling,719.3340000000001 * _xScaling,201.453 * _yScaling,809.25 * _xScaling,174.471 * _yScaling,);
    path.cubicTo(899.1659999999999 * _xScaling,147.49 * _yScaling,989.0840000000001 * _xScaling,82.735 * _yScaling,1034.04 * _xScaling,50.358000000000004 * _yScaling,);
    path.cubicTo(1034.04 * _xScaling,50.358000000000004 * _yScaling,1079 * _xScaling,17.98 * _yScaling,1079 * _xScaling,17.98 * _yScaling,);
    path.cubicTo(1079 * _xScaling,17.98 * _yScaling,1079 * _xScaling,277 * _yScaling,1079 * _xScaling,277 * _yScaling,);
    path.cubicTo(1079 * _xScaling,277 * _yScaling,0 * _xScaling,277 * _yScaling,0 * _xScaling,277 * _yScaling,);
    path.cubicTo(0 * _xScaling,277 * _yScaling,0 * _xScaling,50.358 * _yScaling,0 * _xScaling,50.358 * _yScaling,);
    path.cubicTo(0 * _xScaling,50.358 * _yScaling,0 * _xScaling,50.358 * _yScaling,0 * _xScaling,50.358 * _yScaling,);
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
  
}