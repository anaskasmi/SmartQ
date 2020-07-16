import 'package:SmartQ/utilities/user_interface_utilities/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final BuildContext screenContext;

  RegisterButton({Key key, this.text, this.onTap, this.screenContext})
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
          color: Colors.deepOrange.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.white70),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}
