import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),

              // EMAIL INPUT FIELD
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Email...',
                  prefixIcon: Icon(Icons.email, color: Colors.red,),
                ),
              ),

              const SizedBox(height: 8,),

              // PASSWORD INPUT FIELD
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password...',
                  prefixIcon: Icon(Icons.lock, color: Colors.red,),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont\'t yet have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Create one.'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
