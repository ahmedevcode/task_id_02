import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_id_02/core/style/styles.dart';
import 'package:task_id_02/feature/inputform/controller/inputform_cubit.dart';
import 'package:task_id_02/feature/inputform/presentation/screens/widgets/displayscreeninfo.dart';

class InputFormHome extends StatefulWidget {
  const InputFormHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputFormHomeState createState() => _InputFormHomeState();
}

class _InputFormHomeState extends State<InputFormHome> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondcolor,
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          'Input Form',
          style: appbarStyle,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<InputformCubit, InputformState>(
        builder: (context, state) {
          if (state is InputformSuccess) {
            _nameController.text = state.name ?? '';
            _emailController.text = state.email ?? '';
            _phoneController.text = state.phone ?? '';
          }
          return Baseinputbody(context);
        },
      ),
    );
  }

  Padding Baseinputbody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildInputField(
              label: 'Name',
              labelStyle: secondcolor,
              controller: _nameController,
              icon: Icons.person,
              onChanged: (value) {
                context.read<InputformCubit>().changeForm(
                      name: value,
                      email: _emailController.text,
                      phone: _phoneController.text,
                    );
              },
            ),
            const SizedBox(height: 20),
            _buildInputField(
              label: 'Email',
              labelStyle: secondcolor,
              controller: _emailController,
              icon: Icons.email,
              onChanged: (value) {
                context.read<InputformCubit>().changeForm(
                      name: _nameController.text,
                      email: value,
                      phone: _phoneController.text,
                    );
              },
            ),
            const SizedBox(height: 20),
            _buildInputField(
              label: 'Phone',
              labelStyle: secondcolor,
              controller: _phoneController,
              icon: Icons.phone,
              onChanged: (value) {
                context.read<InputformCubit>().changeForm(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: value,
                    );
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayScreen(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: primarycolor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Submit',
                style: buttomStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required labelStyle,
    required TextEditingController controller,
    required IconData icon,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      // onChanged: onChanged, // Properly passing the callback here.
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        prefixIcon: Icon(
          icon,
          color: primarycolor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
