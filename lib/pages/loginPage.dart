import 'package:example_stack/pages/homePage.dart';
import 'package:example_stack/pages/mainPage.dart';
import 'package:example_stack/pages/signupPage.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 249, 245),
      body: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius:
                  BorderRadiusGeometry.vertical(bottom: Radius.circular(30)),
              child: Image.asset('assets/images/square.png'),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 5)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 130,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Welcome Back',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Log in to continue your journey with FoodPedia",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.6,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username',
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: 'Username'),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Password',
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Mainpage(),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 15,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignupPage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Signup',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
