import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterLine extends StatelessWidget {
  final Character character;
  const CharacterLine({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            // ana sayfadaysak bir geri yapar ve boşluğa düşeriz
            // Navigator.of(context).pop(); 
            //belirtilen sayfaya doğru ilerler.
            Navigator.of(context).pushNamed('/character_detail', arguments: character);
            
          },
          title: Text(
            character.name,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(character.gender),
          trailing: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundImage: NetworkImage(character.image),
            ),
          ),
          leading: Text(character.id.toString()),
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
