import 'package:SmartQ/utilities/user_interface_utilities/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final BuildContext screenContext;

  LoginButton({Key key, this.text, this.onTap, this.screenContext})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = SizeConfig();
    size.init(screenContext);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 3,
          vertical: SizeConfig.blockSizeHorizontal * 2,
        ),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.white70),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 80,
              ),
              child: Text(
                ">",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.white70),
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
