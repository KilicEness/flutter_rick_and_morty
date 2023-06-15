import 'package:flutter/material.dart';
import '../models/location.dart';

class LocationLine extends StatelessWidget {
  final Location location;
  const LocationLine({required this.location, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/location_detail', arguments: location);
          },
          title: Text(
            location.name,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(location.dimension),
          trailing: Text(location.type),
          leading: CircleAvatar(
              child: Text(location.residents.isNotEmpty
                  ? '+' + location.residents.length.toString()
                  : '-')),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
