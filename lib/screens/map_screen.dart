import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'services_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //// Map Controller
  GoogleMapController _mapController;
  ////
  BitmapDescriptor _markerIcon;
  //// Map Markerss
  Set<Marker> _markers = HashSet<Marker>();
  //// first position
  static final CameraPosition initialPosition = CameraPosition(
    target: LatLng(33.541381, -7.673741),
    zoom: 14,
  );
  //set markers icon
  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/agency3.png");
  }

  @override
  void initState() {
    super.initState();
    this._setMarkerIcon();
  }

  //initialise map with markers
  void _onMApCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('0'),
          position: LatLng(33.541381, -7.673741),
          infoWindow: InfoWindow(title: "Inwi", snippet: "inwi Haj Fateh"),
          icon: _markerIcon));
      _markers.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.538426, -7.641794),
        infoWindow: InfoWindow(title: "Inwi", snippet: "inwi Atlantic"),
        icon: _markerIcon,
        onTap: () => {},
      ));
      _markers.add(Marker(
          markerId: MarkerId('2'),
          position: LatLng(33.570820, -7.613070),
          infoWindow: InfoWindow(title: "Inwi", snippet: "inwi 2 mars"),
          icon: _markerIcon));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: initialPosition,
              onMapCreated: _onMApCreated,
              markers: _markers,
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
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width - 30,
                  height: 40,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServicesScreen()),
                      );
                    },
                    color: Colors.blue[500],
                    child: Text(
                      "Get ticket",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
