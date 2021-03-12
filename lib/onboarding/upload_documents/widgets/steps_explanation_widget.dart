import 'package:flutter/material.dart';

class StepsExplanationWidgets extends StatelessWidget {
  final String mainIcon, mainTitle, mainDescription, secondaryTitle;
  final Color accentColor;
  final List<Widget> mainTips;
  final Function mainAction;
  final Widget mainButton;

  StepsExplanationWidgets({
    this.mainIcon,
    this.mainTitle,
    this.mainDescription,
    this.secondaryTitle,
    this.accentColor,
    this.mainTips,
    this.mainAction,
    this.mainButton,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(mainIcon),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mainTitle,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          mainDescription,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  secondaryTitle,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                for (final tips in mainTips) tips,
              ],
            ),
            SizedBox(height: 20),
            mainButton,
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
