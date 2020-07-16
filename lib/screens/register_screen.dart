import 'package:SmartQ/providers/AuthProvider.dart';
import 'package:SmartQ/utilities/styles/main_theme_styles.dart';
import 'package:SmartQ/utilities/user_interface_utilities/screen_size.dart';
import 'package:SmartQ/widgets/loginButton.dart';
import 'package:SmartQ/widgets/registerButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

class RegisterScreen extends StatefulWidget {
  static final routeName = 'loginScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _name;
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
      text: "Something went wrong try other inputs! ",
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
      authProvider.register(_name, _email, _password).then((result) {
        if (!result) {
          _showErrorDialog(context);
          if (mounted) {
            setState(() {
              waitingAuthResponse = false;
            });
          }
        } else {
          Navigator.pop(context);
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
                            margin: EdgeInsets.only(bottom: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.deepOrange,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Text(
                              "Register",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: SizeConfig.textSize * 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "We can't wait to have you on board !",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: SizeConfig.textSize * 4,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 90),
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
                                          Style.formInputDecoration("Name"),
                                      validator: (v) {
                                        if (v.trim().isEmpty) {
                                          return "this field cannot be empty!";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (v) {
                                        this._name = v;
                                      },
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 2,
                                    ),
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
                                        this._password = v;
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
                                        } else if (v != this._password) {
                                          return "Password unmatch !";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (v) {},
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, bottom: 13),
                child: waitingAuthResponse
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        margin: EdgeInsets.only(),
                        child: RegisterButton(
                          screenContext: context,
                          text: 'Register',
                          onTap: _submit,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
