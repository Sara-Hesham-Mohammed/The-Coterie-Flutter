import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String type;
  final Icon typeIcon;
  final TextEditingController controller;
  const InputField({super.key, required this.type, required this.typeIcon, required this.controller,});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        // add email validation
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }

        bool valid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value);
        if (!valid) {
          return 'Please enter a valid ${widget.type}';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: widget.type,
        hintText: 'Enter your ${widget.type}',
        prefixIcon: widget.typeIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {

  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }

        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))
          ),
          suffixIcon: IconButton(
            icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          )),
    );
  }
}
