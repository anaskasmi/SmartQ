import 'package:SmartQ/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgencyItem extends StatelessWidget {
  final nameOfAgency;
  final numberOfAgencies;
  final imageUrl;
  const AgencyItem({
    Key key,
    @required this.nameOfAgency,
    @required this.numberOfAgencies,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //////////////////////////////////////////////////////////////////////
          ////////////////////////////// Logo + info ///////////////////////////
          //////////////////////////////////////////////////////////////////////

          Row(
            children: <Widget>[
              //////////////////////////////////////////////////////
              //////////////////////// Logo ////////////////////////
              //////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(this.imageUrl),
                  ),
                  elevation: 5.0,
                  shape: CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                ),
              ),
              //////////////////////////////////////////////////////
              //////////////////////// Divider /////////////////////
              //////////////////////////////////////////////////////

              VerticalDivider(
                indent: 20,
                endIndent: 20,
                color: Colors.grey,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //////////////////////////////////////////////////////
                    //////////////////////// Title ///////////////////////
                    //////////////////////////////////////////////////////

                    Text(
                      this.nameOfAgency,
                      style: GoogleFonts.lato(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(47, 53, 66, 1.0),
                      ),
                    ),
                    const Divider(
                      height: 10,
                    ),

                    Row(
                      children: <Widget>[
                        //////////////////////////////////////////////////////
                        //////////////////////// Number //////////////////////
                        //////////////////////////////////////////////////////

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            numberOfAgencies.toString(),
                            style: GoogleFonts.lato(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(15, 185, 177, 1.0)),
                          ),
                        ),
                        //////////////////////////////////////////////////////
                        //////////////////////// Text ///////////////////////
                        //////////////////////////////////////////////////////

                        Text(
                          'Agences proches',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ///////////////////////////////////////////////////////////////////////
          ////////////////////////////// GO BUTTON //////////////////////////////
          ///////////////////////////////////////////////////////////////////////
          Container(
            height: double.infinity,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MapScreen()),
  );

              },
              color: Colors.white,
              iconSize: 30,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 0.6,
                  blurRadius: 0.6,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          )
        ],
      ),
          ///////////////////////////////////////////////
          ///////////////// Item Shadow /////////////////
          ///////////////////////////////////////////////

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 0.8,
            blurRadius: 1,
            offset: Offset(0.8,1), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
