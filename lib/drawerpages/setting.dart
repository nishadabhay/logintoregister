import 'package:flutter/material.dart';

class MySetting extends StatelessWidget {
  const MySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SettingVc"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.settings)],
        ),
      ),
    );
  }
}
