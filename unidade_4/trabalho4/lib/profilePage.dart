import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trab_4_mobile/UserProvider.dart';
import 'package:trab_4_mobile/user_model.dart';
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

  getImagePerfil() {
    _image = Image.asset('perfil.png') as File;
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
  UserModel user = new UserModel();

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
          _formKey.currentState!.save();
          var provider = context.read<UserProvider>();
          provider.updateUserinfo(provider.currentUser);
        },
        child: Text('OK'),
      ),
    );
  }

  Widget buildForm() {
    user = context
        .read<UserProvider>()
        .currentUser;

    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 30.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildCircleAvatar(user.img),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Este campo não pode ser vazio.";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Insira seu nome aqui',
                    labelText: 'Nome',
                    labelStyle:
                    TextStyle(color: Colors.tealAccent, fontSize: 20.0),
                  ),
                  initialValue: user.name,
                  onSaved: (name) => user.name = name!,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Bio:",
                  style: TextStyle(color: Colors.tealAccent, fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      hintText: 'Conte um pouquinho sobre você!'),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  initialValue: user.bio,
                  onSaved: (bio) => user.bio = bio!,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Contato:",
                  style: TextStyle(color: Colors.tealAccent, fontSize: 20.0),
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
                  initialValue: user.contact,
                  onSaved: (contact) => user.contact = contact!,
                )
              ],
            ),
          )),
    );
  }

  CircleAvatar buildCircleAvatar(String img) {
    var image = img.isEmpty
        ? "https://www.allianceplast.com/wp-content/uploads/2017/11/no-image.png"
        : img;

    return CircleAvatar(
      backgroundImage: NetworkImage(
        image,
      ),
      radius: 50.0,
    );
  }
}

