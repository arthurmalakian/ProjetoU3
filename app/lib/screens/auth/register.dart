import 'dart:io';
import 'package:app/components/camera_input.dart';
import 'package:app/components/location_input.dart';
import 'package:app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  String name = '';
  String email = '';
  String password = '';
  String password_confirmation = '';
  String parlor_name = '';
  String parlor_description = '';
  double parlor_long = 0.0;
  double parlor_lati = 0.0;

  final _titleController = TextEditingController();

  //deve receber a imagem
  File? _pickedImage;

  void _selectImage(File? pickedImage) {
    _pickedImage = pickedImage;
  }

  //

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    print('tem os dados');

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        actions: [
          IconButton(
            icon: const Icon(Icons.question_mark),
            tooltip: 'faq',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('//TODO')));
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(Icons.account_box_outlined),
                ),
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  name = text.toString();
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  email = text.toString();
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  icon: Icon(Icons.password_outlined),
                ),
                obscureText: true,
                onChanged: (text) {
                  password = text.toString();
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                  icon: Icon(Icons.password_outlined),
                ),
                obscureText: true,
                onChanged: (text) {
                  password_confirmation = text.toString();
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome do Estabelecimento',
                    icon: Icon(Icons.store_outlined),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    parlor_name = text.toString();
                  },
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Breve descrição do salão',
                  icon: Icon(Icons.auto_stories_outlined),
                ),
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  parlor_description = text.toString();
                },
              ),
              LocationInput(),
              ImageInput(this._selectImage),
              ElevatedButton(
                  onPressed: () async {
                    var response = User.register(
                        name,
                        email,
                        password,
                        password_confirmation,
                        parlor_name,
                        parlor_description,
                        _pickedImage!,
                        0,
                        0);
                  },
                  child: const Text("Cadastrar"))
            ],
          )),
    );
  }
}
