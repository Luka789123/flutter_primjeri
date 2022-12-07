import 'package:flutter/material.dart';
import 'package:layouts/box.dart';
import 'package:layouts/second_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  //polje u kojem se nalaze naši testni podaci
  final List<String> list = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 13',
    'Item 14',
    'Item 15',
    'Item 16',
    'Item 17',
    'Item 18',
    'Item 19',
    'Item 20',
    'Item 21',
    'Item 22',
    'Item 23',
    'Item 24',
    'Item 25',
    'Item 26',
    'Item 27',
    'Item 55',
    'Item 42',
    'Item 55',
    'Item 63',
    'Item 75',
    'Item 85',
    'Item 92',
    'Item 102',
    'Item 112',
    'Item 122',
    'Item 135',
    'Item 145',
    'Item 155',
    'Item 163',
    'Item 175',
    'Item 183',
    'Item 195',
    'Item 205',
    'Item 213',
    'Item 222',
    'Item 232',
    'Item 243'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  //Prilokom pritiska na gumba navigator gura SecondPage na vrh NavigationStack-a i ona nam postaje vidljiva.
                  //MaterialPageRoute radi prijelaze između dva ekrana u defaultnom android stilu.Umjesto njega se još može koristit i
                  //CupertinoPageRoute koji radi istu stvar kao i MaterialPageRoute samo s iOS prijelazima.
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SecondPage()));
                },
                icon: const Icon(Icons.list))
          ],
          title: const Text('Prva ruta'),
        ),
        //GridView  je Widget koji svoju djecu prikazuje kao rešetku na ekranu, ima razne konstruktore od kojih je
        //najkorisniji GridView.builder zato što koristi lazy rendering svoje djece.
        //
        //
        //Lazy rendering je crtanje odnosno instanciranje djece kako se pojavljuju u viewport-u tj. kako postaju vidljiva na ekranu.
        //
        //Primjetite kako se ispisju imena samo onih Box-ova koji neposredno ulaze u viewport odnosno postaju vidljiva na ekranu.
        //Lazy rendering je jako koristan za smanjenje korištenja resursa platforme
        // kad imamo velik broj widgeta za prikazati i ne želimo ih prikazat sve od jednom,
        // ili kad imamo popriličan broj skupih(u smislu procesne snage) widgeta
        //koje ne smjemo obradit sve od jednom

        body: GridView.builder(

            //Item count određiva koliko će widgeta itemBuilder nacrtat na ekran, mi želimo da su
            //to svi elementi polja list
            itemCount: list.length,
            // u grid delegate prosljeđujemo informacije koje su neophodne za
            //crtanje widgeta prosljeđenih u itemBuilder na ekran
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 25),

            //itemBuilder je zadužen za  crtanje widgeta koje smo definirali kao njegov povrat na ekran
            //on ima zasebni context(kojeg ćemo označit s "_" pošto ga ne koristimo) i index
            //kojeg možemo korisitit za pristupanje elementima niza
            itemBuilder: (_, index) => Box(text: list[index])));
  }
}

/*

Još jedan od konstruktora GridView-a. GridView.count konstruktnoru možemo proslijediti 
fiksan broj djece Widgeta koji će biti prikazana na ekranu, što je relativno spor i loš način
pošto sve jedno djete moramo ručno pozivati i proslijeđivati vrijednosti u njihov 
konstruktor(primjer možete vidjeti u SecondPage Widgetu kod ListView - a).

Bolji način bi bio pozivanje metode "map" koja će pristupiti svakom elementu 
polja i njegovu vrijednost pridodjeliti novom Box widgetu


GridView.count(
          crossAxisCount: 3,
          children: list.map((e) => Box(text: e)).toList(),
        )
        
        
        */
