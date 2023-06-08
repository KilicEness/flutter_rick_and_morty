import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

//models
import '../../../models/episode.dart';

//widgets
import '../../../widgets/episode_line.dart';

//event -> request -> response -> model -> use
class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({super.key});

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  String _errorMessage = '';
  bool _fetching = false;
  List<Episode> _episodes = [];

  Future<void> getEpisodes() async {
    try {
      setState(() {
        _fetching = true;
      });

      var url = Uri.https('rickandmortyapi.com', '/api/episode');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw 'Service not working!!';
      }
      var jsonResponse = convert.jsonDecode(response.body);

      List<Episode> responseEpisodes = [];

      for (var result in jsonResponse['results'] as List) {
        Episode resultEpisode = Episode(
            id: result['id'],
            name: result['name'],
            airDate: result['air_date'],
            episode: result['episode'],
            characters: result['characters'],
            url: result['url'],
            created: result['created']);
        responseEpisodes.add(resultEpisode);
      }

      setState(() {
        _episodes = responseEpisodes;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _fetching = false;
      });
    }
  }

  @override
  void initState() {
    getEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episodes'),
        actions: [
          if (_fetching)
            Container(
              margin: EdgeInsets.all(17),
              height: 20,
              width: 23,
              child: (CircularProgressIndicator(
                color: Colors.black,
              )),
            ),
          if (!_fetching)
            (IconButton(
              onPressed: getEpisodes,
              icon: Icon(Icons.refresh),
            ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ..._episodes
                .map((episode) => EpisodeLine(episode: episode))
                .toList(),
            if (_fetching)
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: (CircularProgressIndicator()))),
            if (_errorMessage != '')
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: (Text(_errorMessage)))),
          ],
        ),
      ),
    );
  }
}
