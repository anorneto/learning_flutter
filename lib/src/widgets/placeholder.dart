import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'HELLO NAV BAR!!!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}
