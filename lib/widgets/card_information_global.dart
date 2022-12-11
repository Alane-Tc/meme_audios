import 'dart:ffi';
import 'dart:typed_data';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_card/image_card.dart';
import 'package:soundpool/soundpool.dart';

class CardInformationGlobal extends StatelessWidget {
  const CardInformationGlobal(
      {Key? key, required this.nameCard, required this.information})
      : super(key: key);

  final String nameCard;
  final List<Map<String, String>> information;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 400,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('${nameCard}',
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

class Information_card_memes extends StatelessWidget {
  const Information_card_memes({
    Key? key,
    required this.messageTitle,
    required this.urlImage,
    this.urlAudio,
  }) : super(key: key);

  final String messageTitle;
  final String urlImage;
  final String? urlAudio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 190,
      //color: Colors.yellow,
      child: FlipCard(
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        front: CardImage(
          urlImage: urlImage,
          messageTitle: messageTitle,
          urlAudio: urlAudio,
        ),
        back: CardImage(
          urlImage: urlImage,
          messageTitle: messageTitle,
          urlAudio: urlAudio,
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    required this.urlImage,
    required this.messageTitle,
    this.urlAudio,
  }) : super(key: key);

  final String urlImage;
  final String messageTitle;
  final String? urlAudio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: FillImageCard(
        width: 200,
        height: 300,
        imageProvider: AssetImage(
          urlImage,
        ),
        title: Container(
          //color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            messageTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        description: Container(
          //color: Colors.red,
          alignment: Alignment.center,
          child: IconButton(
              alignment: Alignment.center,
              onPressed: () async {
                _soundButton(urlAudio!);
              },
              icon: const Icon(
                Icons.play_circle,
                color: Colors.blue,
                size: 30,
              )),
        ),
        tags: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.all(
                Radius.circular(10)
              ),
              border: Border.all(
                width: 5,
                color: Colors.green,
                style: BorderStyle.solid
              )
            ),
            
            child: Text('2007'),
          ),
          
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
