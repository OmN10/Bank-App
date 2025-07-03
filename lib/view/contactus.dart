import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget infoRow(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[900]),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Us",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 56,
              foregroundImage: AssetImage("assets/logo.png"),
            ),
            const SizedBox(height: 10),
            Text(
              "BankPick Support",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 30),
            infoRow(Icons.phone, "9372616368", () async {
              final uri = Uri.parse("tel:+919372616368");

              if (await canLaunchUrl(uri)) await launchUrl(uri);
            }),
            SizedBox(height: 10),
            infoRow(Icons.email, "support@bankpivk.com", () async {
              final uri = Uri.parse("mailto:omkarnaikare10@gmail.com");

              if (await canLaunchUrl(uri)) await launchUrl(uri);
            }),
            SizedBox(height: 10),
            infoRow(Icons.location_on, "BankPick HQ, Mumbai, India", () async {
              final uri = Uri.parse(
                "https://maps.app.goo.gl/o2DiPuMhjaC2oYVbA",
              );
              if (await canLaunchUrl(uri)) await launchUrl(uri);
            }),
            SizedBox(height: 30),
            Divider(thickness: 1.5),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SEND US A MESSAGE", style: labelStyle()),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: nameController,
                    validator: (v) => v!.isEmpty ? "Enter your name" : null,
                    decoration: fieldDecoration("Your Name"),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    validator: (v) => v!.isEmpty ? "Enter your email" : null,
                    decoration: fieldDecoration("Email Address"),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: messageController,
                    maxLines: 4,
                    validator: (v) => v!.isEmpty ? "Enter a message" : null,
                    decoration: fieldDecoration("Your Message"),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Message sent!")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                      ),
                      child: Text(
                        "SEND",
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle labelStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blue[900],
      fontSize: 14,
    );
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
