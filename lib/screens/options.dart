import 'package:flutter/material.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Options',
        ),
      ),
      body: Center(
        child: Text('Options'),
      ),
    );
  }
}
