import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_uts/main.dart';
import 'home.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController spesifikasiController = TextEditingController();
  TextEditingController merkController = TextEditingController();

  void addData() {
    var url = Uri.parse("https://api.bamswp.my.id/index.php/barang");

    http.post(url, body: {
      "kode": kodeController.text,
      "nama": namaController.text,
      "harga": hargaController.text,
      "spesifikasi": spesifikasiController.text,
      "merk": merkController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Data"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Input Data Barang",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 40,
              color: Colors.black,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                children: [
                  TextField(
                    controller: kodeController,
                    decoration: InputDecoration(
                      labelText: "Kode Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: namaController,
                    decoration: InputDecoration(
                      labelText: "Nama Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: hargaController,
                    decoration: InputDecoration(
                      labelText: "Harga Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: spesifikasiController,
                    decoration: InputDecoration(
                      labelText: "Spesifikasi Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: merkController,
                    decoration: InputDecoration(
                      labelText: "Merk Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  addData();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text("Simpan")),
          ],
        ),
      ),
    );
  }
}
