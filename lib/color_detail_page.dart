import 'package:flutter/material.dart';

class ColorDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Detail',
        ),
      ),
      body: Container(
        color: Colors.indigo,
      ),
    );
  }
}
