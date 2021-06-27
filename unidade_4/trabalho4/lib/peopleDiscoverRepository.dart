import 'package:trab_4_mobile/person.dart';

abstract class IPeopleDiscoverRepository {
  List<Person> getPeople();
}

class PeopleDiscoverRepository implements IPeopleDiscoverRepository {
  PeopleDiscoverRepository();

  @override
  List<Person> getPeople() {
    List<Person> a = [
      Person(
          "Ana Repolho",
          20,
          'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI.',
          'whats: (XX) XXXXX-XXXX'),
      Person(
          "Maria Lurdes",
          32,
          'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI.',
          'insta: @lurdinha'),
      Person(
          "Antônia Moita",
          27,
          'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI.',
          'insta: @tonia'),
    ];

    return a;
  }
}
