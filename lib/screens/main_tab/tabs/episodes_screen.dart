import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//event -> request -> response -> model -> use

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  Future<void> getEpisodes() async {
    var url = Uri.https('rickandmortyapi.com', '/api/episode');
    var response = await http.get(url);
    print(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Episodes'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: getEpisodes, child: Text('Call Episodes API')),
          ],
        ));
  }
}
