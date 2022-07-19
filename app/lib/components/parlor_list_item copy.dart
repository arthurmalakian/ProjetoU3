import 'package:app/models/parlor.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';

class ParlorListItem extends StatelessWidget {
  final Parlor parlor;

  const ParlorListItem(this.parlor);

  void _selectedParlor(BuildContext context) {
    /*
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CountryPlacesScreen(country);
    }));
    */
    Navigator.of(context).pushNamed(
      Routes.haircutListScreen,
      arguments: parlor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _selectedParlor(context),
        child: Padding(
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
                    ])))),
      ),
      elevation: 6,
      margin: const EdgeInsets.all(12),
    );
  }
}
