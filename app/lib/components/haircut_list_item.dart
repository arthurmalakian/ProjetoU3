import 'package:app/models/haircut.dart';
import 'package:flutter/material.dart';

class HaircutListItem extends StatelessWidget {
  final Haircut haircut;

  const HaircutListItem(this.haircut);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(12),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(haircut.imgUrl.toString()),
                        fit: BoxFit.cover)),
                child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(12),
                    child: Stack(children: [
                      Text(
                        "${haircut.name} R\$${haircut.price}",
                        style: TextStyle(
                          fontSize: 30,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        "${haircut.name} R\$${haircut.price}",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                        ),
                      ),
                    ])))));
  }
}
