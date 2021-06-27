import 'package:flutter/material.dart';
import 'package:trab_4_mobile/person.dart';

class personCard extends StatefulWidget {
  final Person person;

  const personCard(this.person);

  @override
  _personCardState createState() => _personCardState();
}

class _personCardState extends State<personCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            _buildGradientBackground(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan, Colors.tealAccent]),
      ),
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              _buildCircleAvatar(),
              SizedBox(
                height: 10.0,
              ),
              _buildHeaderInfo(widget.person.nome!),
              _buildHeaderInfo("${widget.person.idade!} anos"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
      ),
      radius: 50.0,
    );
  }

  Widget _buildHeaderInfo(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22.0,
        color: Colors.black,
      ),
    );
  }

  Widget _buildBodyInfo(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bio:",
            style: TextStyle(color: Colors.tealAccent, fontSize: 28.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildBodyInfo(widget.person.bio!),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Contato:",
            style: TextStyle(color: Colors.tealAccent, fontSize: 28.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildBodyInfo(widget.person.contato!),
        ],
      ),
    );
  }
}
