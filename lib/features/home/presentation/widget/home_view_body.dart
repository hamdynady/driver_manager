import 'package:driver_manager/features/home/presentation/widget/home_headline_cell.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _CustomTableState();
}

class _CustomTableState extends State<HomeViewBody> {
  List<List<String>> tableData = [
    [
      'محمد حمدي',
      '054864845',
      '10-9-2024',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
    ],
    [
      'محمد حمدي',
      '054864845',
      '10-9-2024',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(color: Colors.black, width: 1),
        children: [
          const TableRow(
            decoration: BoxDecoration(color: Colors.blue),
            children: [
              HomeTableCell(headline: 'اسم العميل'),
              HomeTableCell(headline: 'رقم هاتف العميل'),
              HomeTableCell(headline: 'تاريخ التعاقد'),
              HomeTableCell(headline: 'اسم السائق'),
              HomeTableCell(headline: 'رقم هاتف السائق'),
              HomeTableCell(headline: 'تفاصيل'),
            ],
          ),
          ...List.generate(
              6,
              (index) => const TableRow(children: [
                    HomeTableCell(headline: 'محمد'),
                    HomeTableCell(headline: '054215846'),
                    HomeTableCell(headline: '12/8/2024'),
                    HomeTableCell(headline: 'احمد'),
                    HomeTableCell(headline: '054257441'),
                    HomeTableCell(headline: 'تفاصيل'),
                  ]))
        ]);
  }
}
