import 'package:flutter/material.dart';

class CollapsedState extends StatelessWidget {
  const CollapsedState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Text(
          'This is short info header',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
