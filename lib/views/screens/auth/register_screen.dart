import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: SingleChildScrollView(
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
            
                const SizedBox(height: 8,),
            
                // EMAIL INPUT FIELD
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email...',
                    prefixIcon: Icon(Icons.email, color: Colors.red,),
                  ),
                ),
            
                const SizedBox(height: 8,),
            
                // PHONE NUMBER INPUT FIELD
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    hintText: 'Enter Phone...',
                    prefixIcon: Icon(Icons.phone, color: Colors.red,),
                  ),
                  keyboardType: TextInputType.phone,
                ),
            
                const SizedBox(height: 8,),
            
                // PASSWORD INPUT FIELD
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password...',
                    prefixIcon: Icon(Icons.lock, color: Colors.red,),
                  ),
                  obscureText: true,
                ),
            
                const SizedBox(height: 12,),
            
                // REGISTER BUTTON
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text('Register', style: TextStyle(
                        fontSize: 18,
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
