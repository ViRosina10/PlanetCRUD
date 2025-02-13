import 'package:flutter/material.dart';
import 'planet.dart';

class PlanetForm extends StatefulWidget {
  final Planet? planet;

  PlanetForm({this.planet});

  @override
  _PlanetFormState createState() => _PlanetFormState();
}

class _PlanetFormState extends State<PlanetForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late double _distanceFromSun;
  late double _size;
  String? _nickname;

  @override
  Widget build(BuildContext context) {
    // Código continua...
  }
}
