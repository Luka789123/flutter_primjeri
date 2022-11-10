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
class TestApp extends StatelessWidget {
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

//Widget build je mjesto od kojeg flutter počinje s izgradnjom našeg widgeta.Naš widget se sastoji od drugih widgeta koji se sastoje od widgeta itd...
//build metoda ujedno predstavlja scope ili obuhvat koji se rendera odnosno prikazuje na ekranu
//Metoda kao parametar prima BuildContext koji kaže flutteru gdje se točno unutar stabla widgeta nalazi određeni widget
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
              title: Text(title),
            ),
            // Tijelo  naše aplikacije je ono što se nalazi ispod alatne trake(AppBar), ono sadrži Column, što je widget kojem je glavna zadaća
            // slagati widget ispod widgeta, za razliku od Row koji slaže widget pokraj widgeta. U našem slučaju imamo tri okrugla gumba koji se
            //nalaze jedan ispod drugog
            body: Column(
              children: const [
                //Widget 1
                //Padding predstavlja prazni prostor oko Widgeta,Padding prima EdgeInsets ovdje koristimo EdgeInsets.symmetric(vertical:8) koji nam daje
                // 8 pixela paddinga s gornje i donje strane, imamo još i horizontal parametar koji bi nam dao padding s lijeve i desne strane zasebno
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  //Align koristimo da poravnamo widget u određeni kut ekrana Roditelja Widgeta
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: MyWidget(
                        name: 'Gronji',
                        c: Colors.amber,
                      )),
                ),

                // Widget 2
                //Ovdje koristimo EdgeInsets.only konstruktor kojem možemo specificirati samo jednu stranu na kojoj želimo padding, u našem slučaju to je top
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: MyWidget(
                        name: 'Srednji',
                        c: Colors.purple,
                      )),
                ),

                //Widget 3
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: MyWidget(
                        name: 'Donji',
                        c: Colors.blueGrey,
                      )),
                )
              ],
            )));

// vraćamo prero varijablu
    return pero;
  }
}

// Naša widget koji sadrži IconButton i Container. konstruktor mu sadrži dva named parametra: tekst koji se ispisuje
//kad korisnik klikne gumb, boju gumba, te ključ
//kod named konstruktora ukoliko polje ne smije biti null moramo staviti required notaciju, dok ukoliko može ispred podatkovnog tipa
// varijable stavljamo upitnik npr. final String? name
class MyWidget extends StatelessWidget {
  final String name;
  final Color c;
  const MyWidget({Key? key, required this.name, required this.c})
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
        icon: const Icon(
          color: Colors.white,
          Icons.add_circle,
          size: 15,
        ),
        onPressed: () {
          print('Pritisnut sam ' + name);
        },
      ),
    );
  }
}
