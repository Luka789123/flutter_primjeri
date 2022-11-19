//Ovo je mjesto gdje uvozimo pakete odnsono klase i widgete koji su nam potrebni.Unutar "material.dart" knjižnice nalaze se klase koje su nam potrebne
//za ovaj primjer kao što su StatelessWidget,Scaffold,MaterialApp...
import 'package:flutter/material.dart';

//void main nam predstavlja početnu točku naše aplikacije,dok nam metoda runApp uzima Widget kojoj joj dajemo kao argument te ga proširuje
//preko cijelog zaslona.
void main() {
  runApp(const TestApp(title: 'Testna aplikacija'));
}

//Klasa TestApp nasljeđuje od StatelessWidget klase
//U flutteru osim StatelessWidgeta još postoje:
// -StatefullWidget koje se koristi kada očekujemo od našeg Widgeta da mjenja stanja odnosno
// da mijenja neke vizualne elemente korisničkog sučeljka koje on prikazuje
//-InheritedWidget kojeg koristimo ako prosljeđujemo neke podatke
//kroz WidgetTree
class TestApp extends StatefulWidget {
  //TestApp sadrži polje tipa String koje je označeno prefixom "final".Taj final kaže flutteru da se toj varijabli vrijednost može
  //dodjeliti samo jednom. Prefix const kaže flutteru da se parametri TestApp-a neće mjenjati tokom izvođenja programa

  final String title;

//Konstruktor naše aplikacije se sastoji od 2 named parametra, što su: Key i title. Named parametar znači da možemo
// staviti parametre u naš konstruktor u bilo kojem redu dok god ih označimo njihovim imenom, "super" anotacija označava da se ključ koji se unosi u
//naš konstruktor prosljeđuje dalje super klasi odnosno klasi od koje je naš widget nasljeđen. Ključeve koristimo
//kad želimo sačuvati stanje prilikom promjene pozicije našeg widgeta unutar stabla widgeta.
  const TestApp({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

//klasa _TestAppState predstavlja stanje klase TestApp
class _TestAppState extends State<TestApp> {
//Widget build je mjesto od kojeg flutter počinje s izgradnjom našeg widgeta.Naš widget se sastoji od drugih widgeta koji se sastoje od widgeta itd...
  @override
  Widget build(BuildContext context) {
    //varijabli pero podatkovnog tipa Widget smo dodjelili MaterialApp. MaterialApp služi kao svojevrsno izvorište naše aplikacije.
    //omogućava nam navigaciju između više ruta, obradu informacija vezanih za ekran kao što su visina i širina ekrana, orijentacija ekrana...
    Widget pero = MaterialApp(
        //Scaffold predstavalja  platno na kojem se naši widgeti slažu,odnosno slikaju, te je on nužan za bilo koju rutu
        home: Scaffold(
            // Scaffold između ostalog prima i parametar AppBar koji predstavlja alatnu traku naše mobilne aplikacije,AppBar ima još i parametar title
            //koji je naslov naše rute odnosno trenutnog ekrana. Naslov kao i sve ostalo ne mora nužno biti Text već može biti
            //bilo koji drugi widget
            appBar: AppBar(
              title: Text(widget.title),
            ),
            // Tijelo  naše aplikacije je ono što se nalazi ispod alatne trake(AppBar), ono sadrži Column, što je widget kojem je glavna zadaća
            // slagati widget ispod widgeta, za razliku od Row koji slaže widget pokraj widgeta. U našem slučaju imamo tri okrugla gumba koji se
            //nalaze jedan ispod drugog
            body: const MaterialBody()));

// vraćamo prero varijablu
    return pero;
  }
}

//Stvorili smo StatefullWidget Material body kako bi mogli mijenjati stanje tj. tekst brojača prikazanog u centru ekrana
// prilikom pritiska gumba.
//Da smo umjesto StatefullWidget-a koristili StatelessWidget naša varijabla counter bi se i dalje u pozadini
//inkrementirala no te promjene nebi bile vidljive na ekranu.
class MaterialBody extends StatefulWidget {
  const MaterialBody({Key? key}) : super(key: key);

  @override
  State<MaterialBody> createState() => _MaterialBodyState();
}

class _MaterialBodyState extends State<MaterialBody> {
  //deklariramo i instanciramo varijablu counter
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),

          // Umjesto zapisa Text('$counter') to smo još mogli zapisati kao i Text(counter.toString()).Razlika je u tome
          //što u prvom zapisu varijablu tipa counter mi ne pretvaramo u string dok to u drugom primjeru radimo.
          child: Text('$counter'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Widget 1
            //Padding predstavlja prazni prostor oko Widgeta,Padding prima EdgeInsets ovdje koristimo EdgeInsets.symmetric(vertical:8) koji nam daje
            // 8 pixela paddinga s gornje i donje strane, imamo još i horizontal parametar koji bi nam dao padding s lijeve i desne strane zasebno
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              //Align koristimo da poravnamo widget u određeni kut ekrana Roditelja Widgeta
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Increment(
                    icon: Icons.add,
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    name: 'Gronji',
                    c: Colors.amber,
                  )),
            ),

            // Widget 2
            //Ovdje koristimo EdgeInsets.only konstruktor kojem možemo specificirati samo jednu stranu na kojoj želimo padding, u našem slučaju to je top
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Increment(
                    icon: Icons.remove,
                    onTap: () {
                      setState(() {
                        counter--;
                      });
                    },
                    name: 'Srednji',
                    c: Colors.purple,
                  )),
            ),

            //Widget 3
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Increment(
                    icon: Icons.restart_alt,
                    onTap: () {
                      setState(() {
                        counter = 0;
                      });
                    },
                    name: 'Donji',
                    c: Colors.blueGrey,
                  )),
            ),
            Increment(
                name: 'set 100',
                c: Colors.blue,
                onTap: () {
                  setState(() {
                    counter = 100;
                  });
                },
                icon: Icons.money),
            //TODO dodajte dva nova gumba jedan za uvećanje brojača za 10 drugi za smanjenje brojača za 10.
            //TODO gumb za uvećane neka se zove "add 10", nek je crvene boje nijanse shade300, odaberite proizvoljnu ikonu s Google Fonts-a
            //TODO gumb za umanjenje nek se zove "sub 10" i nek je smeđe boje nijanse shade300, odaberite proizvoljnu ikonu s Google Fonts-a
          ],
        ),
      ],
    );
  }
}

// Naša widget koji sadrži IconButton i Container. konstruktor mu sadrži dva named parametra: tekst koji se ispisuje
//kad korisnik klikne gumb, boju gumba, te ključ
//kod named konstruktora ukoliko polje ne smije biti null moramo staviti required notaciju, dok ukoliko može ispred podatkovnog tipa
// varijable stavljamo upitnik npr. final String? name
class Increment extends StatelessWidget {
  final String name;
  final Color c;
  final IconData icon;
  //Na VoidCallback tip varijable možemo gledati kao na funkciju koja je spremljena u varijabli onTap i ona će se izvest
  // jednom kad korisnik napravi neku radnju gdje je mi programski pozivamo(u našem primjeru kad pritisnemo gumb).
  final VoidCallback onTap;
  const Increment(
      {Key? key,
      required this.name,
      required this.c,
      required this.onTap,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // unutar varijable size spremili smo veličinu zaslona koju smo dobili od  kalse MediaQuery.Ona nam je ujedino i primjer InheritedWidget-a
    final Size size = MediaQuery.of(context).size;

    // Naša build metoda vraća Container koji je 15% širine ekrana i 15% visine ekrana

    return Container(
      width: size.width * 0.15,
      height: size.height * 0.15,
      // unutar decoration - a možemo mjenjati boju,oblik,dodavati obrube našem Container - u
      decoration: BoxDecoration(color: c, shape: BoxShape.circle),

      // IconButton kad se dotakne, pomoću naredbe print ispisiva neki tekst u konzolu. IconButton -u moramo dodjeliti parametre icon,
      //koja predstavlja ikonu koja će biti ispisana na gumbu(To ne mora nužno biti Ikona već može biti i Text, Row koji sadrži ikonu i tekst... nebitno
      //dok je god tipa Widget)
      child: IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          onPressed: onTap),
    );
  }
}
