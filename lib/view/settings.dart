import 'package:bank_appp/view/contactus.dart';
import 'package:bank_appp/view/login.dart';
import 'package:bank_appp/view/password.dart';
import 'package:bank_appp/view/profile.dart';
import 'package:bank_appp/view/terms.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Text(
              "General",
              style: TextStyle(fontSize: 21, color: Colors.grey),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: ListTile(
              leading: Text(
                "My Profile",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Divider(),
          SizedBox(height: 10),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUsPage()),
              );
            },
            child: ListTile(
              leading: Text(
                "Contact us",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Divider(),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Text(
              "Security",
              style: TextStyle(fontSize: 21, color: Colors.grey),
            ),
          ),
          SizedBox(height: 10),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Password()),
              );
            },
            child: ListTile(
              leading: Text(
                "Chnage Password",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Divider(),
          SizedBox(height: 10),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Terms()),
              );
            },
            child: ListTile(
              leading: Text(
                "Privacy & Policy",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: ListTile(
              leading: Text(
                "Log Out",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
