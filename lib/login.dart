// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _MyWidgetState();

// }

// class _MyWidgetState extends State<Login> {
//   var prymery = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//         home: Scaffold(

//           appBar: AppBar(title: Text("Login widget"),) ,
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(

//               key: prymery,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [

//                   TextFormField(
//                     decoration: InputDecoration(
//                       label: Text("Name"),
//                       hintText: "Enter Your Full name",
//                     ),
//                     validator: (value) {

//                       if(value!.isEmpty){

//                         return "is empty pl";
//                       }
//                       else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){

//                         return "please enter A-Z , a-z";
//                       }

//                       return null;
//                     },

//                   ),

//                   TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       label: Text("Email"),
//                       hintText: "Enter Full name",
//                     ),
//                     validator: (value) {

//                       if(value!.isEmpty){

//                         return "is empty pl";
//                       }
//                       else if (!value.endsWith('.com')||!value.contains('@')){

//                         return "please enter correct Email";
//                       }

//                       return null;
//                     },

//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       label: Text("Phone"),
//                       hintText: "Enter Your Phone Number",
//                     ),
//                     validator: (value) {

//                       if(value!.isEmpty){

//                         return "is empty pl";
//                       }
//                       else if (!RegExp(r'^[0-9]+$').hasMatch(value)){

//                         return "please enter correct Email";
//                       }

//                       return null;
//                     },

//                   ),

//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 15,
//                       ),
//                       ElevatedButton(onPressed: (){
//                         setState(() {
//                           if(prymery.currentState!.validate()){
//                             Navigator.pushNamed(context, 'home');
//                           }
//                         });

//                       }, child: Text('Login',)),
//                     ],
//                   )

//                 ],
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home2.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Login"),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(146, 0, 0, 0),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Logo
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage:
//                     AssetImage('assets/p5.png'), // ضع صورة هنا إذا أردت
//               ),
//               SizedBox(height: 20),

//               // Email Field
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   hintText: "Enter your email",
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Email cannot be empty";
//                   } else if (!value.contains('@') || !value.endsWith('.com')) {
//                     return "Please enter a valid email";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 15),

//               // Password Field
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   hintText: "Enter your password",
//                   prefixIcon: Icon(Icons.lock),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Password cannot be empty";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),

//               // Login Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Check if credentials are correct
//                     if (emailController.text == "salem@gmail.com" &&
//                         passwordController.text == "123") {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => HomePage(
//                                   username: 'salem',
//                                   email: "salem@gmail.com")));
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Invalid email or password"),
//                           backgroundColor: Colors.red,
//                         ),
//                       );
//                     }
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   backgroundColor: const Color.fromARGB(179, 33, 149, 243),
//                 ),
//                 child: Text(
//                   "Login",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),

//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home2.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFA45963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Logo
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/library_welcome.png'),
              ),
              const SizedBox(height: 20),

              // Email Field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email, color: Color(0xFFA45963)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFA45963)),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty";
                  } else if (!value.contains('@') || !value.endsWith('.com')) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Password Field
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFFA45963)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFA45963)),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Check if credentials are correct
                    if (emailController.text == "salem@gmail.com" &&
                        passwordController.text == "123") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            username: 'salem',
                            email: "salem@gmail.com",
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid email or password"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: const Color(0xFFA45963),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
