import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Agencies extends StatefulWidget {
  @override
  _AgenciesState createState() => _AgenciesState();
}

class _AgenciesState extends State<Agencies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agences'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          // ListTile(
          //   title: Text(
          //     'Inwi',
          //     style: GoogleFonts.roboto(
          //       fontSize: 24,
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          //   subtitle: Text('33 agence proche de toi'),
          //   leading: CircleAvatar(
          //     radius: 28,
          //     backgroundImage: NetworkImage(
          //         'https://i.pinimg.com/originals/e6/7f/2b/e67f2b955d8def67e25229355cb70bcf.jpg'),
          //   ),

          // ),
          Container(
            height: 100,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/e6/7f/2b/e67f2b955d8def67e25229355cb70bcf.jpg'),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Inwi',
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '33 agences proche de toi',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                  color: Colors.blueAccent,
                  iconSize: 30,
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
