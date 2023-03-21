import 'package:bloc_and_dio_test/bloc/home_bloc.dart';
import 'package:bloc_and_dio_test/bloc/counter_event.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'button_share_social_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Payment Link',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SharePaymentPage(title: 'Escolha como compartilhar o link'),
    );
  }
}

class SharePaymentPage extends StatefulWidget {
  const SharePaymentPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SharePaymentPage> createState() => SharePaymentState();
}

class SharePaymentState extends State<SharePaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'Escolha como compartilhar o link',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(left: 16, right: 16, top: 64),
          child: Column(children: <Widget>[
            Container(
              constraints:  BoxConstraints(maxHeight: 220, maxWidth: 400),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow:  [
                    BoxShadow(
                        color: Color.fromRGBO(217, 217, 217, 0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding:  EdgeInsets.only(top: 16),
                child: Column(
                  children: <Widget>[
                     Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text("R\$ 125,00"),
                      ),
                    ),
                     SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding:  EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: DottedBorder(
                        dashPattern:  [3, 4],
                        radius:  Radius.circular(10),
                        strokeWidth: 1,
                        color:  Color.fromRGBO(189, 187, 187, 1),
                        child: Container(
                          alignment: Alignment.center,
                          constraints:  BoxConstraints(
                              maxWidth: 360, maxHeight: 45),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color:  Color.fromRGBO(217, 217, 217, 0.5),
                          ),
                          child:  Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                  child: Text(
                                    "https://finance.2DFSEW2",
                                    style: TextStyle(
                                        color: Color.fromRGBO(149, 142, 142, 1),
                                        fontSize: 14),
                                  ))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 10),
                            child: ButtonShareSocialWidget(
                              title: "Copiar",
                              image: Image.asset("assets/ic_copy.png",
                                  width: 21, height: 25),
                              onTap: () {
                                print("Copiar!");
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ButtonShareSocialWidget(
                              title: "WhatsApp",
                              image: Image.asset("assets/ic_wpp.png",
                                  width: 21, height: 25),
                              onTap: () {
                                print("51980631903!");
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ButtonShareSocialWidget(
                              title: "Email",
                              image: Image.asset("assets/ic_mail.png",
                                  width: 21, height: 25),
                              onTap: () {
                                print("matheuskittler@gmail.com!");
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: ButtonShareSocialWidget(
                              title: "Compartilhar",
                              image: Image.asset("assets/ic_share.png",
                                  width: 21, height: 25),
                              onTap: () {
                                print("Compartilhar!");
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
             SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    side:  BorderSide(
                        width: 1.0, color: Color.fromRGBO(84, 118, 67, 1)),
                    backgroundColor: Colors.white),
                child:  Padding(
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 75, right: 75),
                  child: Text(
                    "Gerar novo link",
                    style: TextStyle(
                        fontSize: 24, color: Color.fromRGBO(85, 85, 85, 1)),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
