import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final txtuser = TextEditingController();
  String nUsername, nPassword;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UAS - Rima Novi Datasya'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 42, right: 42, top: 32, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
            ),
            TextField(
              controller: txtuser,
              decoration: InputDecoration(
                   prefixIcon: Icon(Icons.vpn_key),
                  hintText: 'Input Nirm Mahasiswa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)))),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                width: 200,
                height: 40,
                margin: EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                    color: Color(0XFF2a3ed7),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      nUsername = txtuser.text;

                      if (nUsername == "2018020839")
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Utama()));
                    },
                    child: Text('Login', style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Utama extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/Info Mahasiswa' :(BuildContext context) => new Data(),
        '/Total Bayar' :(BuildContext context) => new InputBarang(),
      },
      
      
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Informasi Mahasiswa '),
          backgroundColor: Colors.purple,
        ),
        //body
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            MyMenu(judul: "Info Mahasiswa", icon: Icons.assignment_ind),
            MyMenu(judul: "Total Bayar", icon: Icons.point_of_sale),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  //Atribut
  final String judul;
  final IconData icon;
  final MaterialColor warna;
  //constructor
  MyMenu({this.judul, this.icon, this.warna});

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {Navigator.pushNamed(context, '/$judul');},
        splashColor: Colors.blue,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size:70.0),
              Text(judul, style: new TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}

class Data extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Data Mahasiswa"),
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            subtitle: const Text('Nama Mahasiswa'),
            title: const Text('Rima Novi Datasya'),
          ),
          new ListTile(
            subtitle: const Text('Jenis Kelamin'),
            title: const Text('Perempuan'),
          ),
           new ListTile(
            subtitle: const Text('Alamat'),
            title: const Text('Desa Perguroan Kec Bangun Purba'),
             ),
           new ListTile(
            subtitle: const Text('Jurusan'),
            title: const Text('Sistem Informasi'),
          ),
        ],
      ),
    );
  }
}

class InputBarang extends StatefulWidget {
  createState() => _InputBarangInputDataState();
}

class _InputBarangInputDataState extends State<InputBarang> {
  
  final _namabarang = TextEditingController();
  final _jumlah = TextEditingController();
  final _harga = TextEditingController();
  String _totalbayar='';
 

  onHitung() {
    setState(() {
      var hitung= int.parse(_harga.text)* int.parse( _jumlah .text);
      _totalbayar =
         "Total Pembayaran = $hitung";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Input Barang"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
         decoration: InputDecoration(labelText: " Nama Barang"),
            ),
             TextField(
              controller: _jumlah,
              decoration: InputDecoration(labelText: "Jumlah Barang"),
            ),
            TextField(
              controller: _harga,
              decoration: InputDecoration(labelText: "Harga Barang"),
            ),
            RaisedButton(
              child: Text("Hitung"),
              onPressed: onHitung,
            ),
            Text("$_totalbayar"),
          ],
        ),
      ),
    );
  }
}
class Gagal extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            " GAGAL LOGIN ",
          ),
        ),
        body: Center(child: Text("ANDA GAGAL LOGIN !!!!", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))));
  }
}
