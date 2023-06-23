import 'dart:convert';

void main() {
  // Person person = Person(, 30); //to json
  // String json = jsonEncode(personToJson(person));
  // print(json);

  String json = '{"name":"Ashif","age":50}';
  Person person = personFromJson(json);
  print(person.name);
  print(person.age);
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

Map<String, dynamic> personToJson(Person person) {
  return {
    'name': person.name,
    'age': person.age,
  };
}

//personFromJson
Person personFromJson(String json) {
  Map<String, dynamic> data = jsonDecode(json); //data = {"key":"value"}
  //print(data.toString());
  return Person(
    //name
    data['name'],
    //age
    data['age'],
  );
}
