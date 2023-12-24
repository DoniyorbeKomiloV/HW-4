import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'helper.dart';
import 'users_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegistrationBody();
  }
}

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({super.key});

  @override
  _RegistrationBodyState createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const Center(
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                textFormFieldItem(_usernameController, 8, 10, 'Username', 'Please enter your email'),
                const SizedBox(
                  height: 20,
                ),
                textFormFieldItem(_passwordController, 8, 10, 'Password', 'Please enter your password'),
                const SizedBox(
                  height: 20,
                ),
                textFormFieldItem(_phoneController, 8, 10, 'Phone', 'Please enter your phone'),
                const SizedBox(
                  height: 20,
                ),
                textFormFieldItem(_emailController, 8, 10, 'Email', 'Please enter your email'),
                const SizedBox(
                  height: 20,
                ),
                textFormFieldItem(_addressController, 8, 10, 'Address', 'Please enter your address'),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          _usernameController.clear();
                          _passwordController.clear();
                          _phoneController.clear();
                          _emailController.clear();
                          _addressController.clear();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                            foregroundColor: MaterialStateProperty.all(Colors.black)),
                        child: const Text('Clear'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Create a User object from the input data
                            User user = User(
                              null,
                              _usernameController.text,
                              _passwordController.text,
                              _phoneController.text,
                              _emailController.text,
                              _addressController.text,
                            );

                            // Save the user data to the database
                            DBHelper dbHelper = DBHelper();
                            await dbHelper.saveUser(user);

                            // Show a success message
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('User data saved')));
                            await dbHelper.testRead("user.db");
                            _usernameController.clear();
                            _passwordController.clear();
                            _phoneController.clear();
                            _emailController.clear();
                            _addressController.clear();
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.cyan),
                            foregroundColor: MaterialStateProperty.all(Colors.black)),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                      foregroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UsersScreen()),
                    );
                  },
                  child: const Text('All Users'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
