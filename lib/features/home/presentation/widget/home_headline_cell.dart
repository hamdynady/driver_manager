import 'package:flutter/material.dart';

class HomeTableCell extends StatelessWidget {
  const HomeTableCell({
    super.key,
    required this.headline,
    //this.verticalAlignment,
  });
  final String headline;
  //final TableCellVerticalAlignment? verticalAlignment;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      //verticalAlignment: verticalAlignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          headline,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }
}
