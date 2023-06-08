/* "id": 1,
"name": "Pilot",
"air_date": "December 2, 2013",
"episode": "S01E01",
"characters":[
"https://rickandmortyapi.com/api/character/1",
"https://rickandmortyapi.com/api/character/2",
"https://rickandmortyapi.com/api/character/35",
"https://rickandmortyapi.com/api/character/38",
],
"url": "https://rickandmortyapi.com/api/episode/1",
"created": "2017-11-10T12:56:33.798Z" */

class Episode {
  int id;
  String name;
  String airDate;
  String episode;
  List<dynamic> characters;
  String url;
  String created;

  Episode(
      {required this.id,
      required this.name,
      required this.airDate,
      required this.episode,
      required this.characters,
      required this.url,
      required this.created});
}
