import 'package:flutter/material.dart';

class ExpandedState extends StatelessWidget {
  final VoidCallback? onPressed;

  const ExpandedState({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'This is a bla bla description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.print,
                  color: Colors.white,
                ),
                Icon(
                  Icons.copy,
                  color: Colors.white,
                ),
                Icon(
                  Icons.cut,
                  color: Colors.white,
                ),
                Icon(
                  Icons.paste,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xFF094687))),
              onPressed: onPressed,
              child: Text('Go to Next'),
            )
          ],
        ),
      ),
    );
  }
}
