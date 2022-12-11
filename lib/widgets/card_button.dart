import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CardButtonScreen extends StatefulWidget {
  const CardButtonScreen({Key? key}) : super(key: key);

  @override
  State<CardButtonScreen> createState() => _CardButtonScreenState();
}

class _CardButtonScreenState extends State<CardButtonScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromARGB(255, 226, 226, 226),
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: size.height * 0.5,
      child: ImageSlideshow(
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Image.asset('assets/cards/tengo_miedo.jpg'),
          Image.asset('assets/cards/tengo_miedo.jpg'),
          Image.asset('assets/cards/fua_imagen.jpg'),
          Image.asset('assets/cards/tengo_miedo.jpg'),
        ],
      ),

    );
  }
}
