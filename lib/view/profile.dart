import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  loadProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    nameController.text = prefs.getString("username") ?? "";
    bankAccountController.text = prefs.getString("bankAccount") ?? "";
    emailController.text = prefs.getString("email") ?? "";
    passwordController.text = prefs.getString("password") ?? "";
    phoneController.text = prefs.getString("phone") ?? "";
  }

  saveProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", nameController.text);
    await prefs.setString("bankAccount", bankAccountController.text);
    await prefs.setString("email", emailController.text);
    await prefs.setString("password", passwordController.text);
    await prefs.setString("phone", phoneController.text);

    EasyLoading.showSuccess("Profile Saved");
  }

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/user.png"),
              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("YOUR NAME", style: labelStyle()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: fieldDecoration(),
              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("BANK ACCOUNT NO", style: labelStyle()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: bankAccountController,
                decoration: fieldDecoration(),
              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("EMAIL", style: labelStyle()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: fieldDecoration(),
              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("PHONE NUMBER", style: labelStyle()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: fieldDecoration(),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: saveProfileData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  minimumSize: Size(double.infinity, 45),
                ),
                child: Text(
                  "SAVE CHANGES",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle labelStyle() {
    return TextStyle(
      color: Colors.blue[900],
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
  }

  InputDecoration fieldDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
