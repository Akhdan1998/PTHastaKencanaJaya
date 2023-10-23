import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

import 'login.dart';

class Biodata extends StatefulWidget {
  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height + 100,
          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
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
            children: [
              Text(
                'Akhdan Habibie',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                'Flutter Developer dengan pengalaman pengembangan aplikasi/web, membantu proses desain dan pemeliharaan aplikasi dengan fokus pada peningkatan fitur yang efisien, dan mencari bug pada aplikasi/web perusahaan.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              //pendidikan
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pendidikan',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    'Institut Sains & Teknologi Nasional',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Sarjana Komputer',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '2017 - 2021',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'IPK 3,32 / 4,0',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 12),
              //pengalaman
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengalaman Kerja',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    'Junior Flutter Developer',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Februari 2022 - Sekarang',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Deskripsi Pekerjaan :',
                    style: TextStyle(color: Colors.white),
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            '- ',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          Container(
                            width: MediaQuery.of(context)
                                .size
                                .width -
                                88,
                            child: Text(
                              'Memantau proses jalannya aplikasi dan mengatasi bug atau error pada aplikasi',
                              style: TextStyle(
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            '- ',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          Container(
                            width: MediaQuery.of(context)
                                .size
                                .width -
                                88,
                            child: Text(
                              'Menguji jalanya program dan berdiskusi dengan kelompok demi meningkatkan efektivitas aplikasi',
                              style: TextStyle(
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            '- ',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          Container(
                            width: MediaQuery.of(context)
                                .size
                                .width -
                                88,
                            child: Text(
                              'Fokus dalam merancang, menguji, dan membangun aplikasi',
                              style: TextStyle(
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              //Skill
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keahlian & Kompetensi',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Flutter/Dart',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Firebase',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Jira',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Android Studio',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Github',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Figma',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Visual Studio Code',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'PHP myAdmin/SQL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              //media sosial
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Media Sosial',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        child: Image.asset('assets/ig.png'),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'akhddan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        child: Image.asset('assets/ig.png'),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'pendekargendut',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        child: Image.asset(
                          'assets/github.png',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'https://github.com/Akhdan1998',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        child: Image.asset(
                            'assets/linkedin.png'),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'akhdanhabibie',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
