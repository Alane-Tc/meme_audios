import 'dart:typed_data';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class CarButtonInformationScreen extends StatefulWidget {
  const CarButtonInformationScreen({Key? key}) : super(key: key);

  @override
  State<CarButtonInformationScreen> createState() =>
      _CarButtonInformationScreenState();
}

final information = [
  {
    'title': 'Me amarraron como un puerco!',
    'image': 'assets/cards/puerco_imagen.jpg',
    'sound': 'assets/audio/Me_amarraron_como_puerco_1.mp3'
  },
  {
    'title': 'El Fua',
    'image': 'assets/cards/fua_imagen.jpg',
    'sound': 'assets/audio/EL_FUA_ORIGINAL_2.mp3'
  },
  {
    'title': 'Tengo Miedo!',
    'image': 'assets/cards/tengo_miedo.jpg',
    'sound': 'assets/audio/tengo_miedo_3.mp3'
  },
];

class _CarButtonInformationScreenState
    extends State<CarButtonInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 325,
      color: const Color.fromARGB(255, 226, 226, 226),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Audios Clasicos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: information.length,
              itemBuilder: (_, int index) {
                print('index ${index + 1}');
                return Information_card_memes(
                  messageTitle: information[index]['title']!,
                  messageButton: 'Reproducir audio',
                  urlImage: information[index]['image']!,
                  urlAudio: information[index]['sound']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Information_card_memes extends StatelessWidget {
  const Information_card_memes({
    Key? key,
    required this.messageTitle,
    required this.messageButton,
    required this.urlImage,
    this.urlAudio,
  }) : super(key: key);

  final String messageTitle;
  final String messageButton;
  final String urlImage;
  final String? urlAudio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      child: Column(
        children: [
          FlipCard(
            fill: Fill
                .fillBack, // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL, // default
            front: CardImage(
              urlImage: urlImage,
            ),
            back: CardImage(
              urlImage: urlImage,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            messageTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: () async {
                _soundButton(urlAudio!);
              },
              icon: const Icon(
                Icons.play_circle,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }

  void _soundButton(String url) async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId = await rootBundle.load(url).then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        FadeInImage(
          placeholder: NetworkImage('https://via.placeholder.com/300x400.jpg'),
          image: AssetImage(
              urlImage), //NetworkImage('https://via.placeholder.com/300x400.jpg'),
          width: 130,
          height: 190,
          fit: BoxFit.cover,
        ),
      ]),
    );
  }
}
