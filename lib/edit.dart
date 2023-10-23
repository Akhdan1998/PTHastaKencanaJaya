import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hastakencanajaya/Home.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

class Edit extends StatefulWidget {
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final email = TextEditingController();
  final nama = TextEditingController();
  final job = TextEditingController();
  final birthday = TextEditingController();
  final _formState = GlobalKey<FormState>();
  bool isLoading = false;
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
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
            child: Text('Back'),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: currentUser.currentUser!.email)
              .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              nama.text = data['nama'];
              job.text = data['job'];
              birthday.text = data['birthday'];
              return Form(
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
                          'Edit',
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.bold,
                            color: 'FFFFFF'.toColor(),
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
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
                          textCapitalization: TextCapitalization.sentences,
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
                        SizedBox(height: 25),
                        GestureDetector(
                          onTap: () async {
                            snapshot.data!.docs[0].reference.update({
                              'nama': nama.text,
                              'job': job.text,
                            });
                            Fluttertoast.showToast(
                                msg: "Berhasil mengubah data",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.cyan,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            Get.to(HomePage());
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
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                ),
              );
            }
        }
      ),
    );
  }
}
