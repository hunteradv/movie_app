import 'package:movie_app/model/person.dart';

class PersonResponse {
  final List<Person> persons;
  final String error;

  PersonResponse(this.persons, this.error);

  PersonResponse.fromJson(Map<String, dynamic> json)
      : persons =
            (json["persons"] as List).map((e) => Person.fromJson(e)).toList(),
        error = '';

  PersonResponse.withError(String errorValue)
      : persons = [],
        error = errorValue;
}
