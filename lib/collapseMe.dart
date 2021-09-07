import 'package:flutter/material.dart';
import 'package:stack_ui/dummyUiStates/collapsedState.dart';
import 'package:stack_ui/dummyUiStates/expandedState.dart';

class CollapseMe extends StatefulWidget {
  final Function(int)? onButtonPressed;
  final Function(int)? onHeaderPressed;
  final int index;
  final int totalItemCount;
  final Widget? collapsedState;
  final Widget? expandedState;

  const CollapseMe({
    Key? key,
    this.onButtonPressed,
    this.collapsedState,
    this.expandedState,
    required this.index,
    required this.totalItemCount,
    this.onHeaderPressed,
  }) : super(key: key);

  @override
  _CollapseMeState createState() => _CollapseMeState();
}

class _CollapseMeState extends State<CollapseMe> with TickerProviderStateMixin {
  bool _expanded = false;
  double? _height;
  Widget? _expandedState, _collapsedState;

  @override
  void initState() {
    super.initState();
    // _expanded = widget.expanded;
    _expandedState = widget.expandedState ??
        ExpandedState(
          index: widget.index,
          onPressed: () {
            widget.onButtonPressed?.call(widget.index);
          },
        );
    _collapsedState = widget.collapsedState ??
        CollapsedState(
          index: widget.index,
        );
  }

  @override
  Widget build(BuildContext context) {
    _expanded = widget.index == widget.totalItemCount - 1;
    _height = _expanded ? null : 100;
    return Flexible(
      flex: _expanded ? 1 : 0,
      child: AnimatedSize(
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 200),
        vsync: this,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
            widget.onHeaderPressed?.call(widget.index);
          },
          child: Container(
            height: _height,
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlueAccent,
                  blurRadius: 16,
                  spreadRadius: 8,
                ),
              ],
            ),
            child: _expanded ? _expandedState : _collapsedState,
          ),
        ),
      ),
    );
  }
}
