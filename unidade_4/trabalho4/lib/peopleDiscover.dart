import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:trab_4_mobile/peopleDiscoverController.dart';
import 'package:trab_4_mobile/personCard.dart';

class peopleDiscover extends StatefulWidget {
  const peopleDiscover();

  @override
  _peopleDiscoverState createState() => _peopleDiscoverState();
}

class _peopleDiscoverState extends State<peopleDiscover> {
  late PeopleDiscoverController controller;

  List<SwipeItem> swipeItems = List.empty(growable: true);
  late MatchEngine matchEngine;

  bool hasPeople = false;

  void fillSwipeItems() {
    controller.people?.forEach((person) {
      swipeItems.add(SwipeItem(content: personCard(person)));
    });
  }

  @override
  void initState() {
    controller = PeopleDiscoverController();
    controller.getPeopleFromDatabase();

    fillSwipeItems();

    setState(() {
      hasPeople = swipeItems.length > 0;
    });

    matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Descobrir pessoas"),
      ),
      body: buildPage(),
    );
  }

  Widget buildPage() {
    if (hasPeople) {
      return _buildBody();
    } else {
      return _emptyPeopleMessage();
    }
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          SwipeCards(
              matchEngine: matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: swipeItems[index].content,
                );
              },
              onStackFinished: () {
                setState(() {
                  hasPeople = false;
                });
              }),
        ],
      ),
    );
  }

  Widget _emptyPeopleMessage() {
    return Center(
      child: Container(
        child: Text(
          "Não há mais pessoas para mostrar",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
