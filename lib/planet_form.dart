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
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.planet == null ? 'Adicionar Planeta' : 'Editar Planeta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: widget.planet?.name,
                decoration: InputDecoration(labelText: 'Nome do Planeta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do planeta';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: widget.planet?.distanceFromSun.toString(),
                decoration:
                    InputDecoration(labelText: 'Distância do Sol (em UA)'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Por favor, insira um valor positivo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _distanceFromSun = double.parse(value!);
                },
              ),
              TextFormField(
                initialValue: widget.planet?.size.toString(),
                decoration: InputDecoration(labelText: 'Tamanho (em km)'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Por favor, insira um valor positivo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _size = double.parse(value!);
                },
              ),
              TextFormField(
                initialValue: widget.planet?.nickname,
                decoration: InputDecoration(labelText: 'Apelido'),
                onSaved: (value) {
                  _nickname = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(
                        context,
                        Planet(
                            id: widget.planet?.id ?? 0,
                            name: _name,
                            distanceFromSun: _distanceFromSun,
                            size: _size,
                            nickname: _nickname));
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
