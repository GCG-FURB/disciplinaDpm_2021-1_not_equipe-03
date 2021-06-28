import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();

}

class _profilePageState extends State<profilePage> {
  late File _image = new File("perfil");
  final picker = ImagePicker();

  getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    updateSelectedImage(pickedFile);
  }

  useCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    updateSelectedImage(pickedFile);
  }

  getImagePerfil()  {
    _image = Image.asset('perfil.png') as File ;
  }

  updateSelectedImage(pickedFile) {
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

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
    //getImagePerfil();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  child: Container(
                    height: 350.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.tealAccent,
                            radius: 70.0,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/%C3%ADcone-no-estilo-liso-do-usu%C3%A1rio-da-pessoa-para-site-ilustra%C3%A7%C3%A3o-vetor-129831161.jpg"),
                              radius: 68.0,
                              child: ClipOval(
                                  child: Image.file(_image,
                                    fit: BoxFit.cover,
                                    width:140.0,
                                    height: 140.0,
                                  ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                        child: RaisedButton(
                                          color: Colors.blueGrey,
                                          child: Text("Câmera"),
                                          onPressed: useCamera,
                                        )),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                        child: RaisedButton(
                                          color: Colors.blueGrey,
                                          onPressed: () async {
                                            await getImage();
                                          },
                                          child: Text("Galeria"),
                                        )),
                                  ))
                            ],
                          ),
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
        "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=6&m=1223671392&s=170667a&w=0&h=zP3l7WJinOFaGb2i1F4g8IS2ylw0FlIaa6x3tP9sebU=",
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

