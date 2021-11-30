import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.home);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.jpg",
              fit: BoxFit.cover,
            ),
            Text(
              "Welcome $name!",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter Username",
                      ),
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? "Enter Username"
                            : null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Enter Password";
                        else if (value.length < 6)
                          return "Password length is less than 6";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Colors.lightBlue,
                      borderRadius:
                          BorderRadius.circular(changedButton ? 40.0 : 8.0),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 40.0,
                          width: changedButton ? 40.0 : 150.0,
                          alignment: Alignment.center,
                          child: changedButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                          // decoration: BoxDecoration(
                          //   color: Colors.lightBlue,
                          //   borderRadius:
                          //       BorderRadius.circular(changedButton ? 40.0 : 8.0),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
