import 'package:flutter/material.dart';

class CollapsedState extends StatelessWidget {
  final int index; //Just to show on UI
  const CollapsedState({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Text(
          'This is short info header $index',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
