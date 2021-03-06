import 'package:SmartQ/providers/AuthProvider.dart';
import 'package:SmartQ/screens/register_screen.dart';
import 'package:SmartQ/utilities/styles/main_theme_styles.dart';
import 'package:SmartQ/utilities/user_interface_utilities/screen_size.dart';
import 'package:SmartQ/widgets/loginButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool waitingAuthResponse;
  AuthProvider authProvider;

  //initializing values
  @override
  void didChangeDependencies() {
    waitingAuthResponse = false;
    this.authProvider = Provider.of<AuthProvider>(context);
    SizeConfig().init(context);
    super.didChangeDependencies();
  }

  void _showErrorDialog(BuildContext context) {
    BotToast.showText(
      text: "Coudn't Authenticate You! Please Try again",
      textStyle: GoogleFonts.poppins(
        textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (mounted) {
        setState(() {
          waitingAuthResponse = true;
        });
      }
      authProvider.login(_email, _password).then((result) {
        if (!result) {
          _showErrorDialog(context);
          if (mounted) {
            setState(() {
              waitingAuthResponse = false;
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/crop.jfif"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Smart Q",
                                      style: GoogleFonts.meriendaOne(
                                        textStyle: TextStyle(
                                          fontSize: SizeConfig.textSize * 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "Make it timeless",
                                        style: GoogleFonts.pacifico(
                                          textStyle: TextStyle(
                                            fontSize: SizeConfig.textSize * 4,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 90),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                      decoration:
                                          Style.formInputDecoration("Email"),
                                      validator: (v) {
                                        if (v.trim().isEmpty) {
                                          return "this field cannot be empty!";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (v) {
                                        this._email = v;
                                      },
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 2,
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                      obscureText: true,
                                      decoration:
                                          Style.formInputDecoration("Password"),
                                      validator: (v) {
                                        if (v.isEmpty) {
                                          return "this field cannot be empty!";
                                        } else if (v.length < 6) {
                                          return "Password cannot have less than 6 characters!";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (v) {
                                        this._password = v;
                                      },
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 3,
                          ),
                          waitingAuthResponse
                              ? Center(child: CircularProgressIndicator())
                              : Container(
                                  margin: EdgeInsets.only(right: 160),
                                  child: LoginButton(
                                    screenContext: context,
                                    text: 'Log In',
                                    onTap: _submit,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, bottom: 13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 9),
                      child: Text(
                        "You dont have an account?",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.white70),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          "Register",
                          style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: Colors.deepOrangeAccent),
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
