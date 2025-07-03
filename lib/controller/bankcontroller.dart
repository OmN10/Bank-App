import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BankController extends GetxController {
  var users = <Map<String, dynamic>>[].obs;
  var transactions = <Map<String, dynamic>>[].obs;
  var balance = 100000.0.obs;
  var transactionStats = <String, double>{}.obs;
  late Database db;

  @override
  void onInit() {
    super.onInit();
    initDb();
  }

  Future<void> initDb() async {
    final dbPath = join(await getDatabasesPath(), 'bank_app.db');
    db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            balance REAL
          )
        ''');
        await db.execute('''
          CREATE TABLE transactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            receiver TEXT,
            amount REAL,
            timestamp TEXT
          )
        ''');

        final batch = db.batch();
        final names = [
          'Rohit',
          'Rahul',
          'Amit',
          'Vikas',
          'Neha',
          'Simran',
          'Priya',
          'Aarav',
          'Kavya',
          'Arjun',
          'Sneha',
          'Vivek',
          'Nikita',
          'Ramesh',
          'Suresh',
          'Divya',
          'Meena',
          'Karan',
          'Tanya',
          'Akhil',
        ];
        for (var name in names) {
          batch.insert('users', {'name': name, 'balance': 1000.0});
        }
        await batch.commit(noResult: true);
      },
    );
    await fetchUsers();
    await fetchTransactions();
  }

  Future<void> fetchUsers() async {
    final result = await db.query('users');
    users.assignAll(result);
  }

  Future<void> fetchTransactions() async {
    final result = await db.query('transactions', orderBy: 'id DESC');
    transactions.assignAll(result);
    updateTransactionStats(); // 🔵 update chart data
  }

  Future<void> send(String receiverName, double amount) async {
    final receiver = users.firstWhere((user) => user['name'] == receiverName);
    final newBalance = receiver['balance'] + amount;

    await db.update(
      'users',
      {'balance': newBalance},
      where: 'id = ?',
      whereArgs: [receiver['id']],
    );

    await db.insert('transactions', {
      'receiver': receiverName,
      'amount': amount,
      'timestamp': DateTime.now().toIso8601String(),
    });

    balance.value -= amount;

    await fetchUsers();
    await fetchTransactions(); // 🔁 Triggers chart data update
  }

  // 🔵 Replaces getTransactionStatsByDate()
  void updateTransactionStats() {
    final Map<String, double> stats = {};
    for (var txn in transactions) {
      final date = txn['timestamp'].toString().split('T')[0]; // yyyy-mm-dd
      final amount = txn['amount'] as double;
      stats[date] = (stats[date] ?? 0) + amount;
    }
    transactionStats.value = stats; // Triggers Obx rebuilds
  }
}
