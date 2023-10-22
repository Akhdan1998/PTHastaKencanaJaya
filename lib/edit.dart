import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

import 'login.dart';

class Edit extends StatefulWidget {
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final email = TextEditingController();
  final nama = TextEditingController();
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();
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
  bool _obsecureText1 = true;
  bool _obsecureText2 = true;
  bool isLoading = false;
  FocusNode focusNode = FocusNode();

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
                  'Edit',
                  style: GoogleFonts.poppins().copyWith(
                    fontWeight: FontWeight.bold,
                    color: 'FFFFFF'.toColor(),
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 25),
                TextFormField(
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
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  obscureText: _obsecureText1,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: pass1,
                  validator: (value) {
                    if (value == '') {
                      return 'Create Password cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecureText1 = !_obsecureText1;
                        });
                      },
                      child: Icon(
                        _obsecureText1
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
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
                    hintText: 'Create Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  obscureText: _obsecureText2,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: pass2,
                  validator: (value) {
                    if (value == '') {
                      return 'Confirm Password cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecureText2 = !_obsecureText2;
                        });
                      },
                      child: Icon(
                        _obsecureText2
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
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
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () async {
                    //
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
                            'Save',
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

  void showNotifikasi(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message.toString())));
  }
}
