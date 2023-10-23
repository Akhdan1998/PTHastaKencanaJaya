import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

import 'biodata.dart';
import 'edit.dart';
import 'login.dart';

List<String> list = <String>[
  'Choose',
  'Male',
  'Female',
];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool about = true;

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '09141A'.toColor(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Home Page',
          style: GoogleFonts.poppins().copyWith(color: 'FFFFFF'.toColor()),
        ),
        leading: IconButton(
          onPressed: () async{
            Get.to(Biodata());
          },
          icon: Icon(
            Icons.person,
            color: 'FFFFFF'.toColor(),
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async{
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      content: Text(
                        'Yakin akan keluar?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Tidak',
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 12,
                              color: Colors.cyan,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            'Ya',
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 12,
                              color: Colors.cyan,
                            ),
                          ),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Get.to(Login());
                          },
                        ),
                      ]);
                },
              );
            },
            icon: Icon(
              Icons.logout,
              color: 'FFFFFF'.toColor(),
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                //data pengguna
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .where('email',
                            isEqualTo: currentUser.currentUser!.email)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data!.docs[0];
                        return Container(
                          padding: EdgeInsets.only(
                              left: 27, top: 13, right: 14, bottom: 23),
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: '0E191F'.toColor(),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'User Data',
                                    style: GoogleFonts.poppins()
                                        .copyWith(color: 'FFFFFF'.toColor()),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.to(Edit());
                                    },
                                    icon: Icon(
                                      Icons.border_color,
                                      color: 'FFFFFF'.toColor(),
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    'Email : ',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: 'FFFFFF'.toColor(),
                                    ),
                                  ),
                                  Text(
                                    data['email'] ?? '-',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: 'FFFFFF'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Nama : ',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: 'FFFFFF'.toColor(),
                                    ),
                                  ),
                                  Text(
                                    data['nama'],
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: 'FFFFFF'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Job : ',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: 'FFFFFF'.toColor(),
                                    ),
                                  ),
                                  Text(
                                    data['job'],
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: 'FFFFFF'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Tanggal lahir : ',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: 'FFFFFF'.toColor(),
                                    ),
                                  ),
                                  Text(
                                    data['birthday'],
                                    style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      color: 'FFFFFF'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.cyan,
                          ),
                        );
                      }
                    }),
                // SizedBox(height: 18),
                // about
                // Container(
                //   padding:
                //       EdgeInsets.only(left: 27, top: 13, right: 14, bottom: 23),
                //   // alignment: Alignment.bottomLeft,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(16),
                //     color: '0E191F'.toColor(),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'About',
                //             style: GoogleFonts.poppins()
                //                 .copyWith(color: 'FFFFFF'.toColor()),
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 about = !about;
                //               });
                //             },
                //             child: (about == false)
                //                 ? Icon(
                //                     Icons.expand_less,
                //                     color: Colors.white,
                //                   )
                //                 : Icon(
                //                     Icons.expand_more,
                //                     color: Colors.white,
                //                   ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 20),
                //       (about == false)
                //           ? Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   'Akhdan Habibie',
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 15),
                //                 ),
                //                 Text(
                //                   'Flutter Developer dengan pengalaman pengembangan aplikasi/web, membantu proses desain dan pemeliharaan aplikasi dengan fokus pada peningkatan fitur yang efisien, dan mencari bug pada aplikasi/web perusahaan.',
                //                   style: TextStyle(color: Colors.white),
                //                 ),
                //                 SizedBox(height: 10),
                //                 //pendidikan
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'Pendidikan',
                //                       style: TextStyle(
                //                           color: Colors.white,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 15),
                //                     ),
                //                     Text(
                //                       'Institut Sains & Teknologi Nasional',
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                     Text(
                //                       'Sarjana Komputer',
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                     Text(
                //                       '2017 - 2021',
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                     Text(
                //                       'IPK 3,32 / 4,0',
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                   ],
                //                 ),
                //                 SizedBox(height: 12),
                //                 //pengalaman
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'Pengalaman Kerja',
                //                       style: TextStyle(
                //                           color: Colors.white,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 15),
                //                     ),
                //                     Text(
                //                       'Junior Flutter Developer',
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                     Text(
                //                       'Februari 2022 - Sekarang',
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                     Text(
                //                       'Deskripsi Pekerjaan :',
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                     Column(
                //                       children: [
                //                         Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Text(
                //                               '- ',
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                             Container(
                //                               width: MediaQuery.of(context)
                //                                       .size
                //                                       .width -
                //                                   88,
                //                               child: Text(
                //                                 'Memantau proses jalannya aplikasi dan mengatasi bug atau error pada aplikasi',
                //                                 style: TextStyle(
                //                                     color: Colors.white),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                         Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Text(
                //                               '- ',
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                             Container(
                //                               width: MediaQuery.of(context)
                //                                       .size
                //                                       .width -
                //                                   88,
                //                               child: Text(
                //                                 'Menguji jalanya program dan berdiskusi dengan kelompok demi meningkatkan efektivitas aplikasi',
                //                                 style: TextStyle(
                //                                     color: Colors.white),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                         Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,
                //                           children: [
                //                             Text(
                //                               '- ',
                //                               style: TextStyle(
                //                                   color: Colors.white),
                //                             ),
                //                             Container(
                //                               width: MediaQuery.of(context)
                //                                       .size
                //                                       .width -
                //                                   88,
                //                               child: Text(
                //                                 'Fokus dalam merancang, menguji, dan membangun aplikasi',
                //                                 style: TextStyle(
                //                                     color: Colors.white),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //                 SizedBox(height: 12),
                //                 //Skill
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'Keahlian & Kompetensi',
                //                       style: TextStyle(
                //                           color: Colors.white,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 15),
                //                     ),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text(
                //                           'Flutter/Dart',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                         Text(
                //                           'Firebase',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                         Text(
                //                           'Jira',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                       ],
                //                     ),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text(
                //                           'Android Studio',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                         Text(
                //                           'Github',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                         Text(
                //                           'Figma',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                       ],
                //                     ),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text(
                //                           'Visual Studio Code',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                         Text(
                //                           'PHP myAdmin/SQL',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //                 SizedBox(height: 12),
                //                 //media sosial
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'Media Sosial',
                //                       style: TextStyle(
                //                           color: Colors.white,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 15),
                //                     ),
                //                     SizedBox(height: 5),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Container(
                //                           width: 18,
                //                           height: 18,
                //                           child: Image.asset('assets/ig.png'),
                //                         ),
                //                         SizedBox(width: 5),
                //                         Text(
                //                           'akhddan',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                       ],
                //                     ),
                //                     SizedBox(height: 5),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Container(
                //                           width: 18,
                //                           height: 18,
                //                           child: Image.asset('assets/ig.png'),
                //                         ),
                //                         SizedBox(width: 5),
                //                         Text(
                //                           'pendekargendut',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                       ],
                //                     ),
                //                     SizedBox(height: 5),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Container(
                //                           width: 18,
                //                           height: 18,
                //                           child: Image.asset(
                //                             'assets/github.png',
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                         SizedBox(width: 5),
                //                         Text(
                //                           'https://github.com/Akhdan1998',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                       ],
                //                     ),
                //                     SizedBox(height: 5),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Container(
                //                           width: 18,
                //                           height: 18,
                //                           child: Image.asset(
                //                               'assets/linkedin.png'),
                //                         ),
                //                         SizedBox(width: 5),
                //                         Text(
                //                           'akhdanhabibie',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             )
                //           : GestureDetector(
                //               onTap: () {
                //                 setState(() {
                //                   about = !about;
                //                 });
                //               },
                //               child: Center(
                //                 child: Text(
                //                   'Open',
                //                   style: TextStyle(color: Colors.white),
                //                 ),
                //               ),
                //             ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
