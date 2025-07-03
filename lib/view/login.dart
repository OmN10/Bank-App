import 'package:bank_appp/view/botn.dart';
import 'package:bank_appp/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> validate = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obsecuretext = true;
  Future<void> loginCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedUsername = prefs.getString("username") ?? '';
    String savedPassword = prefs.getString("password") ?? '';

    if (username.text == savedUsername && password.text == savedPassword) {
      EasyLoading.showSuccess("Login successful");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Botn()),
      );
    } else {
      EasyLoading.showError("Invalid credentials");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: validate,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.350,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/Rectangle 17.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.0902,
                    right: MediaQuery.of(context).size.width * 0.30,
                    child: Text(
                      "WELCOME",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    right: MediaQuery.of(context).size.width * 0.27,

                    child: Container(
                      height: 150,
                      child: Image.asset("assets/bank pngg 1.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: username,
                  validator:
                      (v) => v!.isEmpty ? "Enter Username or Email" : null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),

                    labelText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.020),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: password,
                  obscureText: obsecuretext,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.password),

                    suffixIcon: IconButton(
                      icon: Icon(
                        obsecuretext ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obsecuretext = !obsecuretext;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.030),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.60,
                child: ElevatedButton(
                  onPressed: () {
                    if (validate.currentState!.validate()) {
                      loginCheck();
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 35, 86, 175),
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.040),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New to Bank App?", style: TextStyle(fontSize: 15)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
