//Uvozimo pakete koje ćemo koristiti u primjeru
import 'package:flutter/material.dart';

// naša glava funkcijja od koje sve počinje
void main() {
  //metoda unutar naše glavne funkcije koja skalira widget koji joj se prosljeđuje
  //kao argument preko cijelog zaslona uređaja
  runApp(const AdderApp());
}

// naša klasa AdderApp koja je ujedino i izvorište naše aplikacije te se unutar
//nje nalazi naš MaterialApp ona mora bit StatelessWidget
class AdderApp extends StatelessWidget {
  const AdderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // sa ovim parametrom smo isključili defaultni banner koji se pojavljuje u
      //gornjem desnom kutu zaslona
      debugShowCheckedModeBanner: false,
      // tijelo naše aplikacije
      home: AdderBody(),
    );
  }
}

class AdderBody extends StatefulWidget {
  const AdderBody({Key? key}) : super(key: key);

  @override
  State<AdderBody> createState() => _AdderBodyState();
}

//Stanje tj. State našeg AdderBody widgeta
class _AdderBodyState extends State<AdderBody> {
  //metoda u kojoj flutter započinje slagati naš widget iz drugih widgeta koje
  //smo mu prosljedili u konstruktor
  //ujedno odavde počima rebuild naših widgeta kad zovemo setState metodu
  @override
  Widget build(BuildContext context) {
    //Scaffold možemo promatrati kao platno na kojem flutter slika naš widget
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zbrajač'),
      ),
      //Center je widget koji centrira svoje djete u center roditelja odnosno
      //widgeta koji se nalazi iznad centra
      body: Center(
          // SingleChildScroll view je widget koji nam omogućuje vertikalni ili
          //horizontalni scroll naših widgeta.Os pomicanja odnosno scroll-anja
          //našeg widgeta mjenjamo promjenom scrollDirection svojstva
          child: SingleChildScrollView(
        child: Column(
          children: [
            //Naš widget redak koji za argumente prima funkciju koja uzima dva
            //broja zbraja ih i vraća rezultat
            Redak(
              calculate: (num1, num2) {
                return num1 + num2;
              },
            ),
            //TODO dodajte widgete Redak koji će oduzimati, množiti i djeliti
            //dva broja, prema gornjem primjeru
            //TODO svakom od Redak widgeta promjenite boje gumba u proizvoljne boje
            //isto tako,promjenite znak računske operacije iz plusa u odgovarajuć znak
            //TODO mala napomena: kod djeljenja pazite na tip varijabli u koje
            //spremate rezultat analogno tome napravite potrebne promejene
          ],
        ),
      )),
    );
  }
}

class Redak extends StatefulWidget {
  //polje koje je tipa Function. To znači da smo definirali da ovo polje
  //konstruktora prima funkciju koja sama prima dva int argumenta te ima povratni tip int.
  final int Function(int num1, int num2) calculate;
  //TODO dodajte polje koje će primati boju koju ćete zatim proslijediti gumbu.
  const Redak({Key? key, required this.calculate}) : super(key: key);

  @override
  State<Redak> createState() => _RedakState();
}

//State ili stanje našeg Redak widgeta
class _RedakState extends State<Redak> {
  // tu deklariramo varijable koje ćemo koristiti dalje unutar scope-a ovog widgeta.
  //Ako nam varijable ne zahtijevaju context trebamo ih instanciranti odmah unutar
  //inicijalizatora(prosor izvan bilo koje metode pa tako i build metode, te direktno
  // u samoj klasi) kako bi izbjegli ponovno instanciranje odnosno dodjeljivanje
  //vrijednosti koju smo joj zadali na početku

  int num1 = 0;
  int num2 = 0;
  int resault = 0;

  @override
  Widget build(BuildContext context) {
    // u ovu varijablu spremamo sve infromacije o veličini našeg zaslona
    Size size = MediaQuery.of(context).size;
    return Column(
      // ovdje poravnavamo djecu Column-a u centar po x i y osi tj po glavnoj
      //osi(koja je kod column-a vertikalna a kod Row-a horizontalna) i križnoj
      //(u slučaju Columna-horizontalnoj ) osi
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          //deklariramo širinu sveukupnog widgeta na 85% ekrana
          width: size.width * 0.85,
          child: Row(
            //red koji nam sadrži naše textfieldove i text-ove
            children: [
              // Padding koji sadrži prvi textfield. Kad koristimo textfieldove važno im
              //je dati ograničenje tj. ograničit im širinu. Mi smo to napravili upotrebom
              //SizedBox widgeta kojem smo odredili širinu na 25% širine zaslona isto tako smo
              //umjesto SizedBox-a mogi koristiti Container,ConstrainedBox ili bilo koji drugi
              //widget kojem možemo ograničiti širinu
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width * 0.25,
                  child: TextField(
                    //onChanged metoda se zove svaki put kad se vrijednost unutar
                    //textfield-a promjeni.Vrijednosti koja se nalazi unutar TextFielda
                    //pristupamo preko varijable value koja se nalazi unutar zagrada. Pošto
                    //varijabla dolazi u String formatu, moramo je parsirat tj. pretvorit u
                    //int format kako bismo mogli dalje s njom barati.To ćemo napraviti pomoću
                    // try i catch kaluza tako da u slučaju da korisnik unese nedozvoljeni format on
                    //dodjeljuje automatski varijabli vrijednost 0
                    onChanged: (value) {
                      try {
                        num1 = int.parse(value);
                      } catch (exception) {
                        num1 = 0;
                      }
                    },
                  ),
                ),
              ),
              //Spacer koristimo kad želimo popuniti sav dostupan prostor između widgeta-a
              const Spacer(),
              const Text('+'),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width * 0.25,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      // ovjde je prikazan "if uvijet u malom" na početku se postavlja uvjet koji mora vraćat ili
                      //biti tipa bool, zatim se stavlja upitnik koji daje flutteru odnosno dartu do znanja da
                      //će se raditi o if uvjetu.Nakon upitnika stavljamo radnju koju želimo obaviti ako
                      //je uvjet istina u našem slučaju ako vrijednost unutar textfielda nije nula želimo
                      //je pretvorit u int format. Nakon dvotočke stavljamo uvjet koji želimo da se ispuni u
                      //slučaju da je if uvjet laž tj. false u našem slučaju dodjeljujemo varijabli num2 vrijednost 0
                      value.isNotEmpty ? num2 = int.parse(value) : num2 = 0;
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('='),
              ),
              //ispisujemo rezultat
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('$resault'),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextButton(
            style: ButtonStyle(
                // Ovdje unutar ButtonStyle-a možemo mjenjati vizualna svojstva našeg
                //gumba.
                //
                //
                //Pomoću metode MaterialStateProperty.resolveWith(
                //     (states) => Colors.amber.shade900) mjenjamo boju gumba

                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.amber.shade900)),

            //kod onPressed metode vraćamo metodu setState koja zakazuje ponovno
            //građenje odnosno slikanje widgeta sa novim vrijednostima. Možemo viditi
            //da u njemu varijabli resault dodjeljujemo povratnu vrijednost funkcije
            //calculate unutar koje unosimo na potrebna mjesta varijable num1 i num2 kako
            //bismo im mogli pristupiti u mjestu gdje zovemo konstruktor widgeta. Kad im pristupimo
            //zborjit ćemo ih te će taj rezultat bit dodjeljen varijabli resault koja će bit ispisana na ekranu
            //
            //
            //
            //
            //NAPOMENA: u StatelessWidget-ima možemo pristupiti vrijednostima koje dobijemo u konstruktoru direktno
            //tj. dovoljno je samo upisati ime polja konstruktora npr. da je widget redak stateless bilo bi
            //dovoljno napisati slijedeće: resault = calculate(num1, num2);. Dok kod StatefulWidget-a
            // moramo joj pristupati putem widget getera widget, primjer možete vidjeti ispod

            onPressed: () => setState(() {
              resault = widget.calculate(num1, num2);
            }),
            child: Text(
              'Equals',
              style: TextStyle(color: Colors.grey.shade200),
            ),
          ),
        )
        //
      ],
    );
  }
}
