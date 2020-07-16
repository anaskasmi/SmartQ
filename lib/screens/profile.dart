import 'package:SmartQ/providers/AuthProvider.dart';
import 'package:SmartQ/utilities/user_interface_utilities/screen_size.dart';
import 'package:SmartQ/widgets/profileHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  static final routeName = 'driverProfileScreen';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthProvider authProvider;
  @override
  void didChangeDependencies() {
    SizeConfig().init(context);
    authProvider = Provider.of<AuthProvider>(context);
    super.didChangeDependencies();
  }

  //logout function
  logout() {
    authProvider?.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: authProvider.user == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                children: <Widget>[
                  ProfileHeader(),
                  // ProfileHeader(currentDriver: currentDriver),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        color: Colors.white,
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: const Text('Phone Number'),
                              subtitle: Text(""),
                            ),
                            Divider(),
                            ListTile(
                              leading: const Icon(Icons.email),
                              title: const Text('Email'),
                              subtitle: authProvider.user.email != null
                                  ? Text(authProvider.user.email)
                                  : Text(""),
                            ),
                            Divider(),
                            ListTile(
                              leading: const Icon(Icons.person_pin_circle),
                              title: const Text('Address'),
                              subtitle: Text(""),
                            ),
                            Divider(),
                            ListTile(
                              leading: const Icon(Icons.stars),
                              title: const Text('Reputation'),
                              subtitle: Text(""),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: SizeConfig.safeBlockVertical * 8,
                    width: SizeConfig.safeBlockHorizontal * 93,
                    child: RaisedButton(
                      onPressed: logout,
                      textColor: Colors.white,
                      color: Colors.cyan,
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
