import 'package:flutter/material.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({
    super.key,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  List<List<String>> tableData = [
    [
      'محمد حمدي',
      '054864845',
      '10-9-2024',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      '500',
      '100'
    ],
    [
      'محمد حمدي',
      '054864845',
      '10-9-2024',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      'محمد حمدي',
      '500',
      '100'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey, width: 2), // Border for the table
        borderRadius: BorderRadius.circular(8),
      ),
      child: DataTable(
        dataTextStyle: const TextStyle(
          color: Colors.amber,
        ),
        columns: <DataColumn>[
          customDataColumn(title: 'اسم العميل'),
          customDataColumn(title: 'رقم هاتف العميل'),
          customDataColumn(title: 'تاريخ التعاقد'),
          customDataColumn(title: 'ساعة بداية المشوار'),
          customDataColumn(title: 'ساعة نهاية المشوار'),
          customDataColumn(title: 'موقع ابتداء المشوار'),
          customDataColumn(title: 'موقغ نهاية المشوار'),
          customDataColumn(title: 'الرحلة بال كم'),
          customDataColumn(title: 'تكلفة المشوار للعميل'),
          customDataColumn(title: 'اسم السائق '),
          customDataColumn(title: 'هاتف السائق'),
          customDataColumn(title: 'تكلفة المشوار السائق'),
          customDataColumn(title: 'الربح'),
        ],
        rows: tableData
            .map(
              (row) => DataRow(
                cells: row
                    .map(
                      (cell) => DataCell(
                        Text(cell),
                        showEditIcon: true,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }

  DataRow customDataRow({required String data}) {
    return DataRow(cells: <DataCell>[
      DataCell(Text(data)),
    ]);
  }

  DataColumn customDataColumn({required String title}) => DataColumn(
        label: SizedBox(
          width: MediaQuery.of(context).size.width * .1,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}
