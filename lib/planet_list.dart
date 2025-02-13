import 'package:flutter/material.dart';
import 'planet.dart';
import 'planet_form.dart';

class PlanetList extends StatefulWidget {
  @override
  _PlanetListState createState() => _PlanetListState();
}

class _PlanetListState extends State<PlanetList> {
  List<Planet> _planets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Planetas'),
      ),
      body: ListView.builder(
        itemCount: _planets.length,
        itemBuilder: (context, index) {
          final planet = _planets[index];
          return ListTile(
            title: Text(planet.name),
            subtitle: Text(planet.nickname ?? ''),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanetForm(planet: planet),
                ),
              );
              if (result != null) {
                setState(() {
                  _planets[index] = result;
                });
              }
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _planets.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlanetForm(),
            ),
          );
          if (result != null) {
            setState(() {
              _planets.add(result);
            });
          }
        },
      ),
    );
  }
}
