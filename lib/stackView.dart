import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stack_ui/collapseMe.dart';
import 'package:stack_ui/collapseMeDao.dart';

class StackView extends StatefulWidget {
  final List<CollapseMeDao> stackItems;

  const StackView({
    Key? key,
    required this.stackItems,
  }) : super(key: key);

  @override
  StackViewState createState() => StackViewState();
}

class StackViewState extends State<StackView> {
  List<CollapseMe> _stackItems = [];
  int _maxStackCount = 1;
  int itemsLength = 0;

  @override
  void initState() {
    super.initState();
    itemsLength = widget.stackItems.length;
    _buildChildren();
  }

  _buildChildren() {
    _stackItems.clear();
    for (int i = 0; i < _maxStackCount; i++) {
      CollapseMeDao item = widget.stackItems[i];
      _stackItems.add(CollapseMe(
        index: i,
        totalItemCount: _maxStackCount,
        onButtonPressed: (index) {
          setState(() {
            _maxStackCount = min(_maxStackCount + 1, itemsLength);
            _buildChildren();
          });
        },
        onHeaderPressed: (index) {
          setState(() {
            _maxStackCount = max(index + 1, 1);
            _buildChildren();
          });
        },
        key: item.key,
        collapsedState: item.collapsedState,
        expandedState: item.expandedState,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _stackItems,
      ),
    );
  }
}
