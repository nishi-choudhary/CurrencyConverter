import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialState();
}

class _CurrencyConverterMaterialState extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void convertCurrency() {
    try {
      double inputValue = double.parse(textEditingController.text);
      setState(() {
        result = inputValue * 81; // Conversion rate from INR to another currency
      });
    } catch (e) {
      setState(() {
        result = 0; // Reset result if input is invalid
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
    }
  }

  void clearInput() {
    setState(() {
      textEditingController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(30),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 253, 23),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Enter amount in INR", // Placeholder text
                  hintStyle: const TextStyle(
                    color: Colors.grey, // Placeholder text color
                  ),
                  labelText: "Please enter the amount in INR",
                  labelStyle: const TextStyle(
                    color: Colors.amber,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true, // Ensures numeric keyboard with decimal point
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: convertCurrency,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Convert"),
                  ),
                  ElevatedButton(
                    onPressed: clearInput,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Clear"),
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