import 'package:flutter/material.dart';

class CollapseMeDao {
  final Key? key;
  final VoidCallback? onButtonPressed;
  final Widget? collapsedState;
  final Widget? expandedState;

  CollapseMeDao({
    this.key,
    this.onButtonPressed,
    this.collapsedState,
    this.expandedState,
  });
}
