import 'package:flutter/material.dart';
import 'package:meme_audios/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Memes Audios')),
      body: SingleChildScrollView(
        child: Column(
            children: [
              CardButtonScreen(),
              CarButtonInformationScreen()
            ],
        ),)
    );
  }
}