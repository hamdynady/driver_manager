import 'package:driver_manager/features/clients/presentation/views/add_client_view.dart';
import 'package:driver_manager/features/travels/presentation/views/add_driver_view.dart';
import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.over,
      constraints: BoxConstraints.expand(
          height: 500, width: MediaQuery.of(context).size.width * .2),
      icon: const Icon(Icons.menu),
      onSelected: (String result) {
        // Handle the menu action here
        if (result == 'اضافة مشوار') {
          Navigator.pushNamed(context, AddClientView.routeName);
        } else if (result == 'اضافة سائق') {
          Navigator.pushNamed(context, AddDriverView.routeName);
        } else if (result == 'تسجيل خروج') {}
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'اضافة مشوار',
          child: Text('اضافة مشوار'),
        ),
        const PopupMenuItem<String>(
          value: 'اضافة سائق',
          child: Text('اضافة سائق'),
        ),
        const PopupMenuItem<String>(
          value: 'تسجيل خروج',
          child: Text('تسجيل خروج'),
        ),
      ],
    );
  }
}
