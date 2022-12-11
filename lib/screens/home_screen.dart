import 'package:flutter/material.dart';
import 'package:meme_audios/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Memes Audios')),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              CardButtonScreen(),
              SizedBox(height: 15),
              CardInformationGlobal(
                nameCard: 'Audios Clásicos',
                information: [
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
                ],
              ),
              SizedBox(height: 15),
              CardInformationGlobal(
                nameCard: 'Audios Populares',
                information: [
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
                ],
              ),
            ],
          ),
        ));
  }
}
