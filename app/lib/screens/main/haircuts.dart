import 'package:app/components/haircut_list_item.dart';
import 'package:app/models/parlor.dart';
import 'package:app/utils/dummy_data.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';

class Haircuts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final parlor = ModalRoute.of(context)!.settings.arguments as Parlor;
    final parlorHaircuts = DUMMY_HAIRCUTS.where((haircuts) {
      return haircuts.parlorId == parlor.id;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(parlor.name.toString()),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outlined),
            tooltip: 'Informações da barbearia',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('É uma barbearia')));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: parlorHaircuts.length + 1,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(parlor.imgUrl.toString()),
                            fit: BoxFit.cover)),
                    child: Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(12),
                        child: Stack(children: [
                          Text(
                            parlor.name.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.black,
                            ),
                          ),
                          // The text inside
                          Text(
                            parlor.name.toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.green,
                            ),
                          ),
                        ]))));

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Text('tes'), Text('t')],
            // );
          } else {
            return HaircutListItem(parlorHaircuts[index - 1]);
          }
        },
      ),
    );
  }
}
