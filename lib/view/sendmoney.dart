import 'package:bank_appp/controller/bankcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMoneyScreen extends StatelessWidget {
  final BankController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Send Money",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              decoration: BoxDecoration(
                color: Color(0xFFF7F3FF),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.deepPurple.shade100),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                leading: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    user['name'][0].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  user['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Balance: \$${user['balance'].toStringAsFixed(2)}",
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Send", style: TextStyle(color: Colors.white)),
                  onPressed: () => _showSendDialog(context, user),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSendDialog(BuildContext context, Map<String, dynamic> user) {
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              "Send to ${user['name']}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount",
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () async {
                  final amount = double.tryParse(amountController.text);
                  if (amount != null && amount > 0) {
                    await controller.send(user['name'], amount);
                    Get.back();
                    Get.snackbar(
                      "Success",
                      "\$${amount.toStringAsFixed(2)} sent to ${user['name']}",
                      colorText: Colors.black,
                      backgroundColor: Colors.white,
                      snackPosition: SnackPosition.TOP,
                    );
                  } else {
                    Get.snackbar(
                      "Error",
                      "Enter a valid amount",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.TOP,
                    );
                  }
                },
                child: Text("SEND", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
    );
  }
}
