import 'package:driver_manager/core/widgets/custom_menu.dart';
import 'package:driver_manager/features/home/presentation/widget/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        actions: const [CustomMenu()],
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: HomeViewBody(),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text("اضافة رحلة"),
      ),
    );
  }
}
