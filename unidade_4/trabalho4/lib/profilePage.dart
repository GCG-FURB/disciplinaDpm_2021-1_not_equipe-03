import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: buildForm(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        onPressed: () {
          onSubmit();
        },
        child: Text('OK'),
      ),
    );
  }

  Widget buildForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  child: Container(
                    height: 250.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCircleAvatar(),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                              controller: _nomeController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Este campo não pode ser vazio.";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Insira seu nome aqui',
                                labelText: 'Nome',
                                labelStyle: TextStyle(
                                    color: Colors.tealAccent, fontSize: 20.0),
                              )),
                          TextFormField(
                            controller: _idadeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Este campo não pode ser vazio.";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'Insira sua idade aqui',
                                labelText: 'Idade',
                                labelStyle: TextStyle(
                                    color: Colors.tealAccent, fontSize: 20.0)),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bio:",
                        style:
                            TextStyle(color: Colors.tealAccent, fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        minLines: 1,
                        maxLines: 4,
                        // initialValue: "valor inicial",
                        decoration: const InputDecoration(
                            hintText: 'Conte um pouquinho sobre você!'),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Contato:",
                        style:
                            TextStyle(color: Colors.tealAccent, fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        minLines: 1,
                        maxLines: 4,
                        decoration: const InputDecoration(
                            hintText: 'Como as pessoas podem te contatar? '),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  CircleAvatar buildCircleAvatar() {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
      ),
      radius: 50.0,
    );
  }

  void onSubmit() {
    if (_nomeController.text.isEmpty) {
      // salvar minhas coisas
      print("INVALIDO");
    } else {
      print("VALIDO");
    }
  }
}
