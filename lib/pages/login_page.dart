import 'package:flutter/material.dart';
import 'package:flutter_cat/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name= "";
  bool   changeButton= false;
  final _formKey= GlobalKey<FormState>();

  moveToHome() async{
    if( _formKey.currentState!.validate()){
      setState(() {
        changeButton=!changeButton;
      });
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton=!changeButton;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: 
      SingleChildScrollView(
        child:Form(
          key: _formKey,
          child: Column(
          children: [
            Image.asset("assets/images/one.png", fit: BoxFit.contain,),
            const SizedBox(height: 20,),
            Text("Welcome $name", 
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32 ),
                child:Column(
                children: [
                TextFormField(
                  onChanged: (value){
                    setState(() {
                      name=value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username"
                  ),
                  validator: (value){
                    print("test $value");
                    if(value !=null && value.isEmpty){
                      return "username cannot be empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                  validator: (value){
                    if(value !=null && value.isEmpty){
                      return "Password cannot be empty";
                    }else if (value !=null && value.length <=6){
                      return "Password length sould be greater than 6 character";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                Material(
                  child: InkWell(
                    onTap: () async{
                        moveToHome();
                    },
                    child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 40,
                    width: changeButton? 80: 150,
                    child: changeButton ? 
                        const Icon(Icons.done ,color: Colors.yellow ,) 
                        : const Center(
                       child : Text("Submit", style: TextStyle(
                            color: Colors.white ,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ) ,
                      ),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius:BorderRadius.circular(5),
                    ),
                    ),
                  ),
                )
              // ElevatedButton(
              //   onPressed: (){
              //     print("data is submitted ");
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              //   style:TextButton.styleFrom(minimumSize:Size(140, 40) ), 
              //   child: Text("Submit")
              // )
              ],
              ),
              )
          ],
              ),
        )
    ,
    )
    );
  }
}