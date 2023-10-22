import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';


class Biodata extends StatefulWidget {
  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  final nama = TextEditingController();
  final job = TextEditingController();
  final birthday = TextEditingController();
  final _formState = GlobalKey<FormState>();
  final LinearGradient _gradient = LinearGradient(
    colors: [
      '94783E'.toColor(),
      'F3EDA6'.toColor(),
      'F8FAE5'.toColor(),
      'FFE2BE'.toColor(),
      'D5BE88'.toColor(),
      'F8FAE5'.toColor(),
      'D5BE88'.toColor(),
    ],
    begin: Alignment.topRight,
    end: Alignment.centerLeft,
  );
  bool isLoading = false;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            color: Colors.transparent,
            child: Text('Kembali'),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Form(
        key: _formState,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  '1F4247'.toColor(),
                  '0D1D23'.toColor(),
                  '09141A'.toColor(),
                ],
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Biodata',
                  style: GoogleFonts.poppins().copyWith(
                    fontWeight: FontWeight.bold,
                    color: 'FFFFFF'.toColor(),
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 25),
                TextFormField(
                  focusNode: focusNode,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: nama,
                  validator: (value) {
                    if (value == '') {
                      return 'Name cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    fillColor: Colors.grey.withOpacity(0.10),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    contentPadding:
                    EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    hintStyle: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    hintText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: job,
                  validator: (value) {
                    if (value == '') {
                      return 'Job cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    fillColor: Colors.grey.withOpacity(0.10),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    contentPadding:
                    EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    hintStyle: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    hintText: 'Pekerjaan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: birthday,
                  validator: (value) {
                    if (value == '') {
                      return 'Birthday cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    fillColor:
                    Colors.grey.withOpacity(0.10),
                    filled: true,
                    hintStyle: GoogleFonts.poppins()
                        .copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: '989797'.toColor(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                        left: 10, top: 5, bottom: 5),
                    hintText: 'DD MM YYYY',
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(9),
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickeddate =
                    await showDatePicker(
                        context: context,
                        initialDate:
                        DateTime.now(),
                        firstDate: DateTime(1945),
                        lastDate: DateTime(2500));

                    if (pickeddate != null) {
                      setState(() {
                        birthday.text =
                            DateFormat('dd-MM-yyyy')
                                .format(pickeddate);
                      });
                    }
                  },
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () async {
                    if (_formState.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      users.add({
                        'nama': nama.text,
                        'job': job.text,
                        'birthday': birthday.text,
                      });
                      nama.text = '';
                      job.text = '';
                      birthday.text = '';
                    } else {}
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          '4599DB'.toColor(),
                          '62CDCB'.toColor(),
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                    child: (isLoading = true)
                        ? Text(
                      'Simpan',
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 15,
                        color: 'FFFFFF'.toColor(),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        : Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: 'FFFFFF'.toColor(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}