import 'package:bank_appp/controller/bankcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final BankController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Transaction History",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () =>
            controller.transactions.isEmpty
                ? Center(child: Text("No transactions yet."))
                : ListView.builder(
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    final tx = controller.transactions[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F3FF),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.deepPurple.shade100),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              tx['receiver'].toString()[0],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            tx['receiver'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Sent \$${tx['amount'].toStringAsFixed(2)}",
                          ),
                          trailing: Text(
                            tx['timestamp'].toString().substring(0, 10),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 62, 41, 41),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
