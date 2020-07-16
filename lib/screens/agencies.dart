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
      // backgroundColor: Colors.deepOrange.shade100.withOpacity(0.9),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg3.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 190,
              // color: Colors.white,
              padding: EdgeInsets.all(0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 30.0, left: 0),
                      child: Image(
                        image: AssetImage("assets/agency2.png"),
                        height: 60,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Text(
                        "Les agences",
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.2),
              thickness: 1,
              indent: 15,
              endIndent: 15,
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
      ),
    );
  }
}
