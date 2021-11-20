import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class Round extends StatelessWidget {
  final double length;
  const Round({Key key, @required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 0,
          ),
          height: length,
          width: length,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: accentHexColor,
          ),
        ),
      ],
    );
  }
}
