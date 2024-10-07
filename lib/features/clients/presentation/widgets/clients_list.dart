import 'package:flutter/material.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
           Container(
            width: MediaQuery.of(context).size.width * .1,
            height: MediaQuery.of(context).size.height * .1,
            color: Colors.blue,
            child: const Text('اسم العميل'),
           ),
        ],),
        ListView.builder( 
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder:(context, index)=> Container(
            width: MediaQuery.of(context).size.width * .1,
            height: MediaQuery.of(context).size.height * .1,
            color: Colors.blue,
            child: const Text('اسم العميل'),
          ),
        ),
      ],
    );
  }
}

