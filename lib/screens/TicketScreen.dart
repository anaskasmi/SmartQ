import 'package:SmartQ/screens/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SmartQ/models/Service.dart';

class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            //info about agency
            Container(
              padding: const EdgeInsets.only(top: 18.0, bottom: 20),
              child: Column(
                children: <Widget>[
                  //Logo
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28.0, bottom: 6),
                      child: Card(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              'https://live.staticflickr.com/4131/5410791885_b215933081_n.jpg'),
                        ),
                        elevation: 5.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                  ),
                  //name
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Inwi",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  //info
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
                                color: Colors.red.shade300,
                                size: 34,
                              )),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Text(
                                  "4 People Waiting",
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
                          endIndent: 9,
                          indent: 9,
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
                                color: Colors.blue.shade300,
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
                          endIndent: 9,
                          indent: 9,
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
                                color: Colors.green.shade300,
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
                  Divider(
                    indent: 33,
                    endIndent: 33,
                    height: 33,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            //Estimated time
            Container(
              width: 300,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.timer,
                      color: Colors.deepOrangeAccent.shade100,
                    ),
                  ),
                  Text(
                    "Estimated Time :  ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    " 43 min",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepOrange.shade300),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 0.7, color: Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(
                        20.0) //                 <--- border radius here
                    ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
//phrase
            Container(
              width: 500,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "After calculating the distance between you and the agency you need to leave by at least 15 before the estimated time",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //get Ticket
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: FlatButton(
                color: Colors.red.shade300,
                child: Text(
                  "Cancel",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServicesScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
