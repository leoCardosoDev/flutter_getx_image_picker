import 'package:flutter/material.dart';

class TipsWidget extends StatelessWidget {
  final String textTips;

  TipsWidget({this.textTips});

  @override
  Widget build(BuildContext context) {
    final Color _primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 20, color: _primaryColor),
          SizedBox(width: 10),
          Flexible(
              child: Text(
            textTips,
            style: TextStyle(fontSize: 18),
          )),
        ],
      ),
    );
  }
}
