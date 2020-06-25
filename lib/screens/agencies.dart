import 'package:SmartQ/widgets/agencies/agencyItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Agencies extends StatefulWidget {
  @override
  _AgenciesState createState() => _AgenciesState();
}

class _AgenciesState extends State<Agencies> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      // appBar: AppBar(
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(right: 20),
      //       child: Icon(Icons.search),
      //     ),
      //   ],
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       // Padding(
      //       //   padding: const EdgeInsets.only(right: 10,left: 10),
      //       //   child: Icon(Icons.location_on),
      //       // ),
      //       // Padding(
      //       //   padding: const EdgeInsets.only(left: 50),
      //       //   child: Text(
      //       //     "Agences",
      //       //     style: GoogleFonts.lato(
      //       //       fontSize: 22,
      //       //       fontWeight: FontWeight.w700,
      //       //     ),
      //       //   ),
      //       // ),
      //     ],
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      body: Column(
        children: <Widget>[
          Container(
            height: 190,
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Image(
                      image: AssetImage("assets/agency2.png"),
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      "Les agences",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "les plus proches de votre localisation",
                      style: GoogleFonts.lato(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            padding: EdgeInsets.all(10),
          ),
          Divider(
            height: 10,
            color: Colors.orange,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(2),
              children: <Widget>[
                AgencyItem(
                  nameOfAgency: 'Inwi',
                  numberOfAgencies: 33,
                  imageUrl:
                      'https://live.staticflickr.com/4131/5410791885_b215933081_n.jpg',
                ),
                AgencyItem(
                  nameOfAgency: 'IAM',
                  numberOfAgencies: 29,
                  imageUrl:
                      'https://www.iam.ma/ImagesMarocTelecom/Phototh%C3%A8que/Images-grandes/maroc-telecom-blanc-ar-grande.jpg',
                ),
                AgencyItem(
                  nameOfAgency: 'Attijari Wafabank',
                  numberOfAgencies: 22,
                  imageUrl:
                      'https://www.attijariwafabank.com/sites/default/files/vactory_map_block/images/awb_factoring2x.png',
                ),
                AgencyItem(
                  nameOfAgency: 'Wafachash',
                  numberOfAgencies: 18,
                  imageUrl:
                      'https://pbs.twimg.com/profile_images/877112486478131200/bnTyuv-6_400x400.jpg',
                ),
                AgencyItem(
                  nameOfAgency: 'Lydec',
                  numberOfAgencies: 12,
                  imageUrl:
                      'https://www.fm6e.org/mobile/images/stories/logo-lidek.jpg',
                ),
                AgencyItem(
                  nameOfAgency: 'Orange',
                  numberOfAgencies: 12,
                  imageUrl:
                      'https://shortways.com/wp-content/uploads/2018/12/Logo-orange-rond-800x800.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
