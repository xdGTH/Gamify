// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:gamify/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                        // duration: Duration(milliseconds: 800),
                        // curve: Curves.bounceIn,
                        top: size.height / 2 - 29,
                        left: size.width / 2 - 29,
                        child: Transform.rotate(
                          angle: -3.1805546814635168e-15 * (pi / 180),
                          child: Container(
                              width: 58,
                              height: 58,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(209.5),
                                  topRight: Radius.circular(209.5),
                                  bottomLeft: Radius.circular(209.5),
                                  bottomRight: Radius.circular(209.5),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment(6.123234262925839e-17, 1),
                                    end: Alignment(-1, 6.123234262925839e-17),
                                    colors: [
                                      Color.fromRGBO(250, 134, 27, 1),
                                      Color.fromRGBO(35, 52, 208, 1)
                                    ]),
                              )),
                        )),
                  ]))),
          Positioned(
              top: 0,
              left: 456,
              child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.bounceIn,
                        top: size.height / 2 - 29,
                        left: size.width / 2 - 29,
                        child: Transform.rotate(
                          angle: -3.1805546814635168e-15 * (pi / 180),
                          child: Container(
                              width: 58,
                              height: 58,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(209.5),
                                  topRight: Radius.circular(209.5),
                                  bottomLeft: Radius.circular(209.5),
                                  bottomRight: Radius.circular(209.5),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment(6.123234262925839e-17, 1),
                                    end: Alignment(-1, 6.123234262925839e-17),
                                    colors: [
                                      Color.fromRGBO(250, 134, 27, 1),
                                      Color.fromRGBO(35, 52, 208, 1)
                                    ]),
                              )),
                        )),
                  ]))),
          // Positioned(
          //     top: 0,
          //     left: 856,
          //     child: Container(
          //         width: size.width,
          //         height: size.height,
          //         decoration: const BoxDecoration(
          //           color: Color.fromRGBO(255, 255, 255, 1),
          //         ),
          //         child: Stack(children: <Widget>[
          //           Positioned(
          //               top: 360,
          //               left: 140,
          //               child: Transform.rotate(
          //                 angle: -3.1805546814635168e-15 * (pi / 180),
          //                 child: Container(
          //                     width: 80,
          //                     height: 80,
          //                     decoration: const BoxDecoration(
          //                       borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(209.5),
          //                         topRight: Radius.circular(209.5),
          //                         bottomLeft: Radius.circular(209.5),
          //                         bottomRight: Radius.circular(209.5),
          //                       ),
          //                       gradient: LinearGradient(
          //                           begin: Alignment(6.123234262925839e-17, 1),
          //                           end: Alignment(-1, 6.123234262925839e-17),
          //                           colors: [
          //                             Color.fromRGBO(250, 134, 27, 1),
          //                             Color.fromRGBO(35, 52, 208, 1)
          //                           ]),
          //                     )),
          //               )),
          //         ]))),
          // Positioned(
          //     top: 0,
          //     left: 1247,
          //     child: Container(
          //         width: size.width,
          //         height: size.height,
          //         decoration: const BoxDecoration(
          //           color: Color.fromRGBO(255, 255, 255, 1),
          //         ),
          //         child: Stack(children: <Widget>[
          //           Positioned(
          //               top: 311,
          //               left: 90,
          //               child: Transform.rotate(
          //                 angle: -3.1805546814635168e-15 * (pi / 180),
          //                 child: Container(
          //                     width: 179,
          //                     height: 179,
          //                     decoration: const BoxDecoration(
          //                       borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(209.5),
          //                         topRight: Radius.circular(209.5),
          //                         bottomLeft: Radius.circular(209.5),
          //                         bottomRight: Radius.circular(209.5),
          //                       ),
          //                       gradient: LinearGradient(
          //                           begin: Alignment(6.123234262925839e-17, 1),
          //                           end: Alignment(-1, 6.123234262925839e-17),
          //                           colors: [
          //                             Color.fromRGBO(250, 134, 27, 1),
          //                             Color.fromRGBO(35, 52, 208, 1)
          //                           ]),
          //                     )),
          //               )),
          //         ]))),
          // Positioned(
          //     top: 0,
          //     left: 1647,
          //     child: Container(
          //         width: size.width,
          //         height: size.height,
          //         decoration: const BoxDecoration(
          //           color: Color.fromRGBO(255, 255, 255, 1),
          //         ),
          //         child: Stack(children: <Widget>[
          //           Positioned(
          //               top: 260,
          //               left: 39,
          //               child: Transform.rotate(
          //                 angle: -3.1805546814635168e-15 * (pi / 180),
          //                 child: Container(
          //                     width: 281,
          //                     height: 281,
          //                     decoration: const BoxDecoration(
          //                       borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(209.5),
          //                         topRight: Radius.circular(209.5),
          //                         bottomLeft: Radius.circular(209.5),
          //                         bottomRight: Radius.circular(209.5),
          //                       ),
          //                       gradient: LinearGradient(
          //                           begin: Alignment(6.123234262925839e-17, 1),
          //                           end: Alignment(-1, 6.123234262925839e-17),
          //                           colors: [
          //                             Color.fromRGBO(250, 134, 27, 1),
          //                             Color.fromRGBO(35, 52, 208, 1)
          //                           ]),
          //                     )),
          //               )),
          //         ]))),
          // Positioned(
          //     top: 0,
          //     left: 2120,
          //     child: Container(
          //         width: size.width,
          //         height: size.height,
          //         decoration: const BoxDecoration(
          //           color: Color.fromRGBO(255, 255, 255, 1),
          //         ),
          //         child: Stack(children: <Widget>[
          //           Positioned(
          //               top: size.height / 2,
          //               left: size.width / 2,
          //               child: Transform.rotate(
          //                 angle: -3.1805546814635168e-15 * (pi / 180),
          //                 child: Container(
          //                     width: 921,
          //                     height: 921,
          //                     decoration: const BoxDecoration(
          //                       borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(209.5),
          //                         topRight: Radius.circular(209.5),
          //                         bottomLeft: Radius.circular(209.5),
          //                         bottomRight: Radius.circular(209.5),
          //                       ),
          //                       gradient: LinearGradient(
          //                           begin: Alignment(6.123234262925839e-17, 1),
          //                           end: Alignment(-1, 6.123234262925839e-17),
          //                           colors: [
          //                             Color.fromRGBO(250, 134, 27, 1),
          //                             Color.fromRGBO(35, 52, 208, 1)
          //                           ]),
          //                     )),
          //               )),
          //         ]))),
        ]));
  }

  static navigate(
      {required String name,
      required Home Function(dynamic context) next,
      required Future Function() until,
      required String startAnimation,
      required String endAnimation}) {}
}
