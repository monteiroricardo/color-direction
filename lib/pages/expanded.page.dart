import 'package:colors_direction/components/lis.colors.dart';
import 'package:flutter/material.dart';

class ExpandedPage extends StatefulWidget {
  final begin;
  final end;

  ExpandedPage(this.begin, this.end);
  @override
  _ExpandedPageState createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: widget.begin,
          end: widget.end,
          colors: cores.toList(),
        ),
      ),
    );
  }
}
