import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/one.png", fit: BoxFit.contain,),
          const SizedBox(height: 20,),
          const Text("Welcome", 
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32 ),
              child:Column(
              children: [
                            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Username",
                labelText: "Username"
              )
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter Password",
                labelText: "Password"
              )
            ),
            ElevatedButton(
              onPressed: (){
                print("data is submitted ")
              },
              style:TextButton.styleFrom(), 
              child: Text("Submit"))
            ],
            ),
            )
        ],
      )
    );
  }
}