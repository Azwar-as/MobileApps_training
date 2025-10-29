import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example_stack/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String messages = "";
  bool _isLoading = false;

  String _mapFirestoreError(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return 'Firestore: Missing or insufficient permissions.';
      case 'unauthenticated':
        return 'Firestore: Session tidak valid (unauthenticated).';
      case 'unavailable':
        return 'Firestore: Service unavailable. Cek koneksi internet.';
      case 'cancelled':
        return 'Firestore: Operation dibatalkan.';
      default:
        return e.message ?? 'Firestore error: ${e.code}';
    }
  }

  String _mapAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Email sudah terdaftar.';
      case 'invalid-email':
        return 'Format email tidak valid.';
      case 'weak-password':
        return 'Password terlalu lemah.';
      case 'operation-not-allowed':
        return 'Metode auth tidak diizinkan.';
      default:
        return e.message ?? 'Gagal Sign Up.';
    }
  }

  Future<void> _saveUserProfile({
    required String uid,
    required String username,
    required String email,
  }) async {
    debugPrint(
        '[SIGNUP] Saving profile to Firestore for uid=$uid username=$username email=$email');
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': username,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      debugPrint('[SIGNUP] Firestore write OK for uid=$uid');
    } on FirebaseException catch (e) {
      debugPrint(
          '[SIGNUP] Firestore write FAILED: code=${e.code} message=${e.message}');
      rethrow;
    }
  }

  void _signup() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        messages = 'All fields are required.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields.')),
      );
      return;
    }
    setState(() {
      _isLoading = true;
      messages = '';
    });
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = cred.user;
      if (user == null) {
        throw FirebaseAuthException(
            code: 'unknown', message: 'User null after sign up.');
      }
      await user.updateDisplayName(username);
      await user.reload();
      final uid = user.uid;
      await _saveUserProfile(uid: uid, username: username, email: email);
      setState(() {
        messages = "Sign Up Success!";
      });
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Loginpage()),
      );
    } on FirebaseAuthException catch (e) {
      final msg = _mapAuthError(e);
      setState(() {
        messages = msg;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg)),
      );
    } on FirebaseException catch (e) {
      final msg = _mapFirestoreError(e);
      setState(() {
        messages = msg;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg)),
      );
    } catch (e) {
      setState(() {
        messages = 'Failed Sign Up';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed Sign Up')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  bool _isObscure = true;
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPasswordShort = _passwordController.text.length < 8 &&
        _passwordController.text.isNotEmpty;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 249, 245),
      body: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(80)),
              child: Image.asset('assets/images/square.png'),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
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
                                'Welcome to FoodPedia',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "We're excited to have you here. Create your account below",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 50,
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
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      labelText: 'Username'),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Email',
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      labelText: 'Email Input'),
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
                                  controller: _passwordController,
                                  obscureText: _isObscure,
                                  onChanged: (value) => setState(() {}),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: isPasswordShort
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        color: isPasswordShort
                                            ? Colors.red
                                            : Colors.black),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                      ),
                                    ),
                                  ),
                                ),
                                if (isPasswordShort)
                                  Text(
                                    'Password must be at least 8 characters long',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed:
                                              _isLoading ? null : _signup,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: _isLoading
                                              ? const SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          color: Colors.white),
                                                )
                                              : const Text(
                                                  'Sign Up',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (messages.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      messages,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: messages
                                                .toLowerCase()
                                                .contains('success')
                                            ? Colors.green
                                            : Colors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Already have an account?'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Loginpage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber,
                                        ),
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
