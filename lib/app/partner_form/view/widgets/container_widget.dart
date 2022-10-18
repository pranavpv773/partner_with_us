import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    required this.color,
    this.radius,
  }) : super(key: key);
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final BorderRadius? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: radius ?? const BorderRadius.all(Radius.circular(0))),
      width: width,
      height: height,
      child: child,
    );
  }
}
