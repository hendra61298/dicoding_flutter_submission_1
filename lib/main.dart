import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:submission/feature/list_pendapatan.dart';
import 'package:submission/widget/my_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perhitungan Pendapatan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const MyHomePage(title: "Perhitungan Pendapatan"),
        '/list': (context) => const ListPendapatan(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int labaKotor;
  late int modal ;
  late int hasil;

  void perhitunganPendapatan (int labaKotor, int modal) async{
    hasil =  labaKotor-modal;
    setState(() {
    });
  }
  @override
  void initState() {
   labaKotor = 0;
   modal = 0;
   hasil =0;
    super.initState();
  }
  var format = NumberFormat.currency(
      locale: 'id',
      symbol: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:
        Container(
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text("Home")
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  child: const Text("List Pendapatan")
              ),
            ],
          ),
        )
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40)
          )
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Masukan Laba Kotor',
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      labaKotor =0;
                    }else{
                      labaKotor = int.parse(value);
                    }
                    perhitunganPendapatan(labaKotor,modal);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Masukan Modal',
                  ),
                  onChanged: (value){
                   if(value.isEmpty){
                      modal =0;
                   }else{
                     modal = int.parse(value);
                   }
                   perhitunganPendapatan(labaKotor,modal);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ],
            ),
          ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: MyCard(text: 'Pendapatan', number: format.format(hasil),),
            ),
          ],
        ),
      ),
    );
  }
}
