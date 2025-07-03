import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  String fromCurrency = '₹';
  String toCurrency = '\$';
  String inputAmount = '';
  String convertedAmount = '0.00';

  final Map<String, double> exchangeRatesToINR = {
    '₹': 1.0,
    '\$': 83.0,
    '£': 105.0,
    '€': 90.0,
  };

  onKeyTap(String key) {
    setState(() {
      if (key == 'X') {
        if (inputAmount.isNotEmpty) {
          inputAmount = inputAmount.substring(0, inputAmount.length - 1);
        }
      } else {
        inputAmount += key;
      }

      double value = double.tryParse(inputAmount) ?? 0;
      double fromRate = exchangeRatesToINR[fromCurrency]!;
      double toRate = exchangeRatesToINR[toCurrency]!;

      double converted = (value * fromRate) / toRate;
      convertedAmount = converted.toStringAsFixed(2);
    });
  }

  void swapCurrencies() {
    setState(() {
      final temp = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = temp;
      onKeyTap('');
    });
  }

  currencyDropdown(String selected, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      value: selected,
      underline: SizedBox(),
      items:
          ['₹', '\$', '£', '€'].map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e, style: TextStyle(fontSize: 20)),
            );
          }).toList(),
      onChanged: onChanged,
    );
  }

  numberPad() {
    final keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '00', '0', 'X'];
    return GridView.builder(
      shrinkWrap: true,
      itemCount: keys.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () => onKeyTap(keys[index]),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(20),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Text(keys[index], style: TextStyle(fontSize: 22)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Currency Converter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  child: Text(
                    fromCurrency,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: swapCurrencies,
                  icon: Icon(
                    Icons.compare_arrows,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.purple,
                  child: Text(
                    toCurrency,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                currencyDropdown(
                  fromCurrency,
                  (val) => setState(() {
                    fromCurrency = val!;
                    onKeyTap('');
                  }),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple.shade200),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Text(
                      inputAmount.isEmpty ? '0.00' : convertedAmount,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 24, color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "CONVERT TO",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                currencyDropdown(
                  toCurrency,
                  (val) => setState(() {
                    toCurrency = val!;
                    onKeyTap('');
                  }),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Text(
                      inputAmount,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(child: numberPad()),
          ],
        ),
      ),
    );
  }
}
