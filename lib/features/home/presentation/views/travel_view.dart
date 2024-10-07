import 'package:driver_manager/features/travels/presentation/widgets/travel_view_body.dart';
import 'package:driver_manager/models/travel_model.dart';

import 'package:flutter/material.dart';

List<TravelModel>? tableData;

class TravelView extends StatelessWidget {
  const TravelView({super.key});
  static const routeName = 'travel';

  // List of rows in the table, each row is a list of cell values
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomTable(),
    );
  }
}
