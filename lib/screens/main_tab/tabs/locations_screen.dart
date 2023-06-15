import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

//models
import '../../../models/info.dart';
import '../../../models/location.dart';

//widgets
import '../../../widgets/location_line.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  Info? _info;
  String _errorMessage = '';
  bool _fetching = false;
  List<Location> _locations = [];

  Future<void> getLocations() async {
    try {
      setState(() {
        _fetching = true;
      });

      var url = Uri.https('rickandmortyapi.com', '/api/location');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw 'Service is not woking';
      }

      var jsonResponse = convert.jsonDecode(response.body);

      Info responseInfo = Info(
          count: jsonResponse['info']['count'],
          pages: jsonResponse['info']['pages'],
          prev: jsonResponse['info']['prev'],
          next: jsonResponse['info']['next']);

      List<Location> responseLocations = [];

      for (var result in jsonResponse['results'] as List) {
        Location resultLocation = Location(
            id: result['id'],
            name: result['name'],
            type: result['type'],
            dimension: result['dimension'],
            residents: (result['residents'] as List).map((e) => e.toString()).toList(),
            url: result['url'],
            created: result['created']);
        responseLocations.add(resultLocation);
      }
      setState(() {
        _info = responseInfo;
        _locations = responseLocations;
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
    getLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Locations'),
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
                onPressed: getLocations,
                icon: Icon(Icons.refresh),
              ))
          ],
        ),
        body: _fetching
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  var location = _locations[index];
                  return LocationLine(location: location);
                },
                itemCount: _locations.length,
              ));
  }
}
