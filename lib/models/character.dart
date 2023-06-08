/*
"id": 1,
"name": "Rick Sanchez",
"status": "Alive",
"species": "Human",
"type": "",
"gender": "Male",
"origin":{"name": "Earth (C-137)", "url": "https://rickandmortyapi.com/api/location/1"…},
"location":{"name": "Citadel of Ricks", "url": "https://rickandmortyapi.com/api/location/3"…},
"image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
"episode":["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2",…],
"url": "https://rickandmortyapi.com/api/character/1",
"created": "2017-11-04T18:48:46.250Z"
 */

class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Map<String, dynamic> origin;
  Map<String, dynamic> location;
  String image;
  List<dynamic> episode;
  String url;
  String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
}
