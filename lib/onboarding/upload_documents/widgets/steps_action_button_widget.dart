import 'package:flutter/material.dart';

class StepsActionButton extends StatelessWidget {
  final Function onPressed;
  final double width, height;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget child;

  StepsActionButton({
    this.width,
    this.height,
    this.color,
    this.onPressed,
    this.padding,
    this.margin,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: width,
        height: height,
        margin: margin,
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: padding,
          onPressed: onPressed,
          child: child,
        ));
  }
}
