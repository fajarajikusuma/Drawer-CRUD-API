import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_uts/main.dart';
import 'home.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController kodeController;
  TextEditingController namaController;
  TextEditingController hargaController;
  TextEditingController spesifikasiController;
  TextEditingController merkController;

  void editData() {
    var url = Uri.parse("https://api.bamswp.my.id/index.php/barang");
    http.put(url, body: {
      "kode": kodeController.text,
      "nama": namaController.text,
      "harga": hargaController.text,
      "spesifikasi": spesifikasiController.text,
      "merk": merkController.text,
    });
  }

  @override
  void initState() {
    kodeController =
        TextEditingController(text: widget.list[widget.index]['kode']);
    namaController =
        TextEditingController(text: widget.list[widget.index]['nama']);
    hargaController =
        TextEditingController(text: widget.list[widget.index]['harga']);
    spesifikasiController =
        TextEditingController(text: widget.list[widget.index]['spesifikasi']);
    merkController =
        TextEditingController(text: widget.list[widget.index]['merk']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT DATA"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Ubah Data Barang",
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
              height: 40,
            ),
            Container(
              child: Column(
                children: [
                  TextField(
                    controller: kodeController,
                    decoration: InputDecoration(
                      labelText: "Kode Barang",
                      enabled: false,
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
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                editData();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text("Ubah"),
            ),
          ],
        ),
      ),
    );
  }
}
