import 'package:flutter/material.dart';
import '/validators/login_validator.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:   false,

      title: 'Login Form',
      color: Colors.amber,
      
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home:  MyHomePage(title: "login Form",),
    );
  }
}
  class MyHomePage extends StatefulWidget {
     MyHomePage({super.key, required this.title});
    final String title;
    
    @override
    State<MyHomePage> createState() => _MyHomePageState();
  } 
  class _MyHomePageState extends State<MyHomePage> {
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final _formKey = GlobalKey<FormState>();
   @override
void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Login Form"),
          centerTitle: true,
          shadowColor: Colors.amber,
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          
              
              children: [
                   SizedBox(
                    height: 100,
                    width: 100,
                   ),
             TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2.0),
                ),
                labelText: 'Enter your Email',
              ),
              validator: validateEmail,
              
            
             ),
              SizedBox(height: 20,),
             TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                 focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2.0),
                ),
                labelText: 'Enter your Password',
              ),
              validator: validatePassword,
             ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                   if (_formKey.currentState!.validate()) {
    // valid
                print("Email: ${_emailController.text}");
                print("Password: ${_passwordController.text}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login successful')),
                );
                } else {
                  // invalid — individual field errors will show automatically
                }
                }, 
                child: Text("Submit",
                style: TextStyle(fontSize: 20),
                )
                
              ),
          
          
            ],)
          ),
        ),
      );
    }
  }