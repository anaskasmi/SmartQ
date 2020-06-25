import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.541381, -7.673741),
    zoom: 14,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Container(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 90,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: Icon(
                              Icons.group,
                              color: Colors.deepOrange,
                              size: 34,
                            )),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: Text(
                                "3 People Waiting",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      VerticalDivider(
                        endIndent: 15,
                        indent: 15,
                        color: Colors.grey,
                        width: 10,
                        thickness: 0.5,
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: Icon(
                              Icons.location_on,
                              color: Colors.indigo,
                              size: 34,
                            )),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: Text(
                                "Inwi Haj Fateh, Hay Oulfa Casablanca",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      VerticalDivider(
                        endIndent: 15,
                        indent: 15,
                        color: Colors.grey,
                        width: 10,
                        thickness: 0.5,
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: Icon(
                              Icons.person_pin,
                              color: Colors.green,
                              size: 34,
                            )),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: Text(
                                "2 Employees",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
