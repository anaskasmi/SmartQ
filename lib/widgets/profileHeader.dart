import 'package:SmartQ/utilities/user_interface_utilities/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
  }) : super(key: key);

  buildImage() {
    return CachedNetworkImage(
      imageUrl: "https://mytaxioffice.com/storage/uploads/IMAGES/man.png",
      imageBuilder: (context, imageProvider) => Container(
        height: SizeConfig.safeBlockVertical * 20,
        width: SizeConfig.safeBlockVertical * 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(4.0, 5.0),
                spreadRadius: 2.0)
          ],
        ),
        alignment: Alignment.center,
      ),
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 5),
          child: buildImage(),
        ),
        Container(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 3),
          child: Text(
            ("Anas" + " " + "KASMI").toUpperCase(),
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5.5,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
