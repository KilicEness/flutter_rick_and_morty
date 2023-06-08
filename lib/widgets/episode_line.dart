import 'package:flutter/material.dart';
import '../models/episode.dart';

class EpisodeLine extends StatelessWidget {
  final Episode episode;
  const EpisodeLine({required this.episode, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            episode.episode,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(episode.airDate),
          trailing: CircleAvatar(
            child: Text('+${episode.characters.length}'),
          ),
          leading: Text(episode.id.toString()),
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
