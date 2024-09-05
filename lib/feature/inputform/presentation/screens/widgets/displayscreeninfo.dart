import 'package:flutter/material.dart';
import 'package:task_id_02/core/style/styles.dart';

class DisplayScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const DisplayScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: secondcolor),
        backgroundColor: primarycolor,
        title: Text(
          'Display Information',
          style: appbarStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Name:', name),
            const SizedBox(height: 10),
            _buildInfoRow('Email:', email),
            const SizedBox(height: 10),
            _buildInfoRow('Phone:', phone),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
