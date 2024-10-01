import 'package:flutter/material.dart';

class Dashboardscreen extends StatelessWidget {
  const Dashboardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Adoção do Ricks'),),
      body:Column(
        children: [
          Image.asset('assets/images/Rectangle 39.png')
        ],
      ),
    );
  }
}