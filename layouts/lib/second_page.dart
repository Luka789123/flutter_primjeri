import 'package:flutter/material.dart';
import 'package:layouts/box.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Leading je ikona koja se prikazuje u lijevom kutu alatne trake. Po defaultu
        //flutter prepoznaje dali postoju ruta ispod trenutne u NaigationStack-u ako
        //postoji tu će automatski biti dostupan gumb za povratak. U ovom primjeru
        //taj gumb je zamijenjen s našim custom gumbom
        //
        leading: IconButton(
            onPressed: () {
              //Navigator uklanja ovu rutu s vrha NavigationStack-a i prethodna ruta postaje
              //ponovno vidljiva.
              //

              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.grid_3x3)),

        automaticallyImplyLeading: false,
        title: const Text('Druga ruta'),
      ),
      //Najosnovniji prikaz ListView - a kojeg koristimo samo kad imamo fiksan
      //broj djece koja se moraju scroll-at gore i dolje, U ovakom slučaju uvjek
      //je bolje koristiti SingleChildScrollView s Column-om kao djetetom
      body: ListView(
        children: const [
          Box(text: 'Item 1'),
          Box(text: 'Item 2'),
          Box(text: 'Item 3'),
          Box(text: 'Item 4'),
          Box(text: 'Item 5'),
          Box(text: 'Item 6'),
        ],
      ),
    );
  }
}

/*
ListView.separated se ponaša kao GridView.builder samo s izuzetkom da crta
elemente koje mu postavimo u separatorBuilder između dva elementa deklariana u 
itemBuilderu

ListView.separated(
          itemCount: 50,
          separatorBuilder: (_, __) => Container(
                color: Colors.blue,
                height: 20,
                width: 150,
              ),
          itemBuilder: (_, i) => SizedBox(
              width: 60, height: 70, child: Box(text: 'Item ${i + 1}'))) */
