import 'package:fluttertutorial/main.dart';
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}


class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _fullName = "";
  bool undergraduateDegree= false;
  bool diplomaDegree = false;
  bool mastersDegree = false;
  bool doctorDegree = false;
  double umur = 0;
  String kelasPBP = 'A';
  List<String> listKelasPBP = ['A', 'B', 'C', 'D', 'E', 'F', 'KI'];
  bool _nilaiSwitch = false;

  String checkJenjang(){
    if(undergraduateDegree) {
      return 'Jenjang Sarjana';
    }else if(diplomaDegree){
      return 'Jenjang Diploma';
    }else if(mastersDegree){
      return 'Jenjang Magister';
    }else{
      return 'Jenjang Doktor';
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,

        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Form', style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22, color: Colors.black54,
        ),
        ),
      ),
      // Menambahkan drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Form'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
          children: [
          Padding(
          // Menggunakan padding sebesar 8 pixels
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(

            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color.fromRGBO(128,212,196,1),),
              ),
              hintText: "Contoh: Pak Dengklek",
              labelText: "Nama Lengkap",
              // Menambahkan icon agar lebih intuitif
              icon: const Icon(Icons.people),
              // Menambahkan circular border agar lebih rapi
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
            ),
            // Menambahkan behavior saat nama diketik
            onChanged: (String? value) {
              setState(() {
                _fullName = value!;
              });
            },
            // Menambahkan behavior saat data disimpan
            onSaved: (String? value) {
              setState(() {
                _fullName = value!;
              });
            },
            // Validator sebagai validasi form
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Nama lengkap tidak boleh kosong!';
              }
              return null;
            },
          ),
        ),
            const Divider(
              height: 1,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.grey),
              //   borderRadius: BorderRadius.circular(5),
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    leading:  Icon(Icons.school),
                    title: Text("Jenjang"),
                  ),
                  CheckboxListTile(
                    title: const Text('Sarjana'),
                    activeColor: Color.fromRGBO(128,212,196,1),
                    value: undergraduateDegree,
                    onChanged: (bool? value) {
                      setState(() {
                        undergraduateDegree = value!;
                        if (value){
                          mastersDegree = diplomaDegree = doctorDegree = false;
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Diploma'),
                    activeColor: Color.fromRGBO(128,212,196,1),
                    value: diplomaDegree,
                    onChanged: (bool? value) {
                      setState(() {
                        diplomaDegree = value!;
                        if (value){
                          mastersDegree = undergraduateDegree = doctorDegree = false;
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Magister'),
                    activeColor: Color.fromRGBO(128,212,196,1),
                    value: mastersDegree,
                    onChanged: (bool? value) {
                      setState(() {
                        mastersDegree = value!;
                        if (value){
                          diplomaDegree = undergraduateDegree = doctorDegree = false;
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Doktor'),
                    activeColor: Color.fromRGBO(128,212,196,1),
                    value: doctorDegree,
                    onChanged: (bool? value) {
                      setState(() {
                        doctorDegree = value!;
                        if (value){
                          mastersDegree = undergraduateDegree = diplomaDegree = false;
                        }
                      });
                    },
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(height: 20,),
                  ListTile(
                    leading: const Icon(Icons.co_present),
                    title: Row(
                      children: [
                        Text('Umur: ${umur.round()}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                              fontWeight: FontWeight.normal),),
                      ],
                    ),
                    subtitle: Slider(
                      value: umur,
                      max: 100,
                      divisions: 100,
                      activeColor: Color.fromRGBO(128,212,196,1),
                      inactiveColor: Color.fromRGBO(128,212,196,1),
                      label: umur.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          umur = value;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: const Icon(Icons.class_),
                    title: const Text(
                      'Kelas PBP',
                    ),
                    trailing: DropdownButton(
                      value: kelasPBP,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listKelasPBP.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          kelasPBP = newValue!;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SwitchListTile(
                    title: const Text('Practice Mode'),
                    activeColor: Color.fromRGBO(128,212,196,1),
                    value: _nilaiSwitch,
                    onChanged: (bool value) {
                      setState(() {
                        _nilaiSwitch = value;
                      });
                    },
                    secondary: const Icon(Icons.run_circle_outlined),
                  ),

                ],
              ),

            ),
            TextButton(
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(128,212,196,1)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 15,
                        child: Container(
                          child: ListView(
                            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                            shrinkWrap: true,
                            children: <Widget>[
                              Center(child: const Text('Informasi Data')),
                              SizedBox(height: 20),
                      
                              Text('Nama Lengkap : ' + '$_fullName'),
                              SizedBox(height: 20),
                              Text('${checkJenjang()}'),
                              SizedBox(height: 20),
                              Text('Umur : ' + umur.toString() ),
                              SizedBox(height: 20),
                              Text('Kelas PBP : ' + '$kelasPBP'),
                              SizedBox(height: 20),
                              if(_nilaiSwitch) Text('Practice Mode On'),
                              SizedBox(height: 20),
                              if(!_nilaiSwitch) Text('Practice Mode Off'),
                              SizedBox(height: 20),

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Kembali'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
        ],),
          ),
        ),
      ),
    );
  }
}