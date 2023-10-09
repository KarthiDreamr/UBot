import 'package:ucare/home_page.dart';

import 'custom_form_field.dart';
import 'text_styling/custom_text_getter.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF1E1E1E),
        body: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Center(
              child: Image.asset(
                "assets/round_ubot_icon.png",
                width: 200,
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Expanded(
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomFormField(
                        label: "Email",
                        hintText: "Enter your username",
                        icon: Icons.help_outline,
                        validator: (string) {
                          return null;
                        },
                      ),
                      CustomFormField(
                        label: "Password",
                        hintText: "Set password",
                        password: true,
                        validator: (string) {
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: CustomText(
                            text: "Forgot password?",
                            context: context,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE0AC94),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Successful')),
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }
                        },
                        child: CustomText(
                          text: "Login",
                          context: context,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
