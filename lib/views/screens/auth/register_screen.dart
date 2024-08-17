import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
        
              // NAME INPUT FIELD
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter Name...',
                  prefixIcon: Icon(Icons.person, color: Colors.red,),
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

              // PHONE NUMBER INPUT FIELD
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter Phone...',
                  prefixIcon: Icon(Icons.phone, color: Colors.red,),
                ),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
