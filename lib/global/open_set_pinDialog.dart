import 'package:flutter/material.dart';

void openSetPinDialog(BuildContext context, TextEditingController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Set Your PIN'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller,
              //obscureText: true, // Hides the PIN input
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your PIN",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              String pin = controller.text.trim();
              if (pin.isNotEmpty && pin.length == 4) {
                print("PIN set: \$pin");
                Navigator.of(context).pop(); // Close the dialog
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please enter a valid 4-digit PIN")),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFFE17055),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Set PIN'),
          ),
        ],
      );
    },
  );
}
