import 'package:app/components/parlor_list_item%20copy.dart';
import 'package:app/utils/dummy_data.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';

class Parlors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: DUMMY_PARLORS.map((parlor) {
          return ParlorListItem(parlor);
        }).toList(),
      ),
    );
  }
}
